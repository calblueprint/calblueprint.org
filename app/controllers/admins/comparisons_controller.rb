module Admins
  class ComparisonsController < BaseController
    load_and_authorize_resource

    def new
      if StudentApplication.remaining.count <= @settings.applicants_remaining
        if StudentApplication.remaining.count <= StudentApplication.needs_comparison.count + 1
          return redirect_to admin_remaining_path, flash: { success: t('admins.comparisons.complete') }

        # The final part of the comparison process will be done by super_admins only. This prevents parallelism issues
        elsif current_admin.student_reviewer?
          return redirect_to root_path, flash: { success: t('admins.comparisons.almost_done') }
        end
      end

      # The category is choosen randomly to give us a fairly even spread
      @category = ComparisonCategory.all.sample

      # TODO: This should be the count per category
      if current_admin.student_reviewer? && current_admin.comparisons.current.count > (100 * ComparisonCategory.count)
        return redirect_to root_path, flash: { success: t('admins.comparisons.almost_done') }
      end

      @comparison = Comparison.new comparison_category: @category
      hold = Hold.where(admin_id: current_admin.id).last
      if hold.nil? || !hold.current?
        needs_comparison = StudentApplication.comparable.needs_comparison.sample(2)
        @left = needs_comparison.first
        if @left.nil?
          return redirect_to admin_student_applications_path, flash: { error: t('admins.comparisons.insufficient')}
        elsif needs_comparison.count > 1
          @right = needs_comparison.second
        else
          @right = StudentApplication.comparable.remaining.where.not(id: @left.id).first
        end
      else
        puts "Found existing hold, populating with category #{hold.comparison_category.title}"
        @left = hold.left
        @right = hold.right
        @category = hold.comparison_category
        return
      end

      if @right.nil?
        redirect_to admin_student_applications_path, flash: { error: t('admins.comparisons.insufficient')}
      else
        Hold.create(admin: current_admin, left: @left, right: @right, comparison_category: @category)
      end
    end

    def create
      last_comp_by_user = Comparison.order(:created_at).where(admin: current_admin).last
      if last_comp_by_user && (Time.now - last_comp_by_user.created_at).to_i < 30.seconds
        redirect_to root_path, flash: {
          error: "You can't create comparisons that quickly. Please read applications carefully."
        }
        return
      end

      hold = Hold.find_hold(current_admin.id, comparison_params[:winner_id], comparison_params[:loser_id])
      if hold || (!Hold.current_hold(comparison_params[:winner_id]) && !Hold.current_hold(comparison_params[:loser_id]))
        if Comparison.create(comparison_params)
          redirect_to new_admin_comparison_path, flash: { success: t('admins.comparisons.create.success') }
        else
          redirect_to root_path, flash: { error: t('admins.comparisons.create.error') }
        end
        hold.release if hold
      else
        redirect_to new_admin_comparison_path, flash: { error: t('admins.comparisons.create.held') }
      end
    end

    private

    def comparison_params
      params.require(:comparison).permit(:winner_id, :loser_id, :comparison_category_id).merge(admin_id: current_user.id)
    end
  end
end

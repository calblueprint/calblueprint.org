module Admins
  class ComparisonsController < BaseController
    load_and_authorize_resource

    def new
      if StudentApplication.remaining.count <= @settings.applicants_remaining &&
         StudentApplication.remaining.count <= StudentApplication.needs_comparison.count + 1
        redirect_to admin_remaining_path, flash: { success: t('admins.comparisons.complete') }
      end

      @comparison = Comparison.new
      hold = Hold.where(admin_id: current_admin.id).last
      if hold.nil? || !hold.current?
        needs_comparison = StudentApplication.comparable.needs_comparison.sample(2)
        @left = needs_comparison.first.try(:decorate)
        if @left.nil?
          return redirect_to admin_student_applications_path, flash: { error: t('admins.comparisons.insufficient')}
        elsif needs_comparison.count > 1
          @right = needs_comparison.second.decorate
        else
          @right = StudentApplication.comparable.remaining.where.not(id: @left.id).first.try(:decorate)
        end
      else
        @left = hold.left.decorate
        @right = hold.right.decorate
        return
      end

      if @right.nil?
        redirect_to admin_student_applications_path, flash: { error: t('admins.comparisons.insufficient')}
      else
        Hold.create(admin: current_admin, left: @left, right: @right)
      end
    end

    def create
      hold = Hold.find_hold(current_admin.id, comparison_params[:winner_id], comparison_params[:loser_id])
      if hold || (!Hold.current_hold(comparison_params[:winner_id]) && !Hold.current_hold(comparison_params[:loser_id]))
        hold.release if hold
        if Comparison.create(comparison_params)
          redirect_to new_admin_comparison_path, flash: { success: t('admins.comparisons.create.success') }
        else
          redirect_to root_path, flash: { error: t('admins.comparisons.create.error') }
        end
      else
        redirect_to new_admin_comparison_path, flash: { error: t('admins.comparisons.create.held') }
      end
    end

    private

    def comparison_params
      params.require(:comparison).permit(:winner_id, :loser_id).merge(admin_id: current_user.id)
    end
  end
end

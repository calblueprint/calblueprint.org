module Admins
  class ComparisonsController < BaseController
    load_and_authorize_resource

    def new
      if StudentApplication.remaining.count <= @settings.applicants_remaining &&
         StudentApplication.remaining.count <= StudentApplication.needs_comparison.count + 1
        redirect_to admin_remaining_path, flash: { success: t('admins.comparisons.complete') }
      end

      @comparison = Comparison.new
      needs_comparison = StudentApplication.needs_comparison.sample(2)
      @left = needs_comparison.first.decorate
      if needs_comparison.count > 1
        @right = needs_comparison.second.decorate
      else
        @right = StudentApplication.remaining.where.not(id: @left.id).first
      end

      if @right.nil?
        redirect_to admin_student_applications_path, flash: { error: t('admins.comparisons.insufficient')}
      end
    end

    def create
      if Comparison.create(comparison_params)
        redirect_to new_admin_comparison_path, flash: { success: t('admins.comparisons.create.success') }
      else
        redirect_to root_path, flash: { error: t('admins.comparisons.create.error') }
      end
    end

    private

    def comparison_params
      params.require(:comparison).permit(:winner_id, :loser_id).merge(admin_id: current_user.id)
    end
  end
end

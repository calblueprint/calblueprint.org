STATES = ['Learning Speed/Independence (Always Innovate)', 'Culture (Mission First)', 'Culture (Be Humble)'].freeze
# 'Technical (Developer)', 
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
      @category = ComparisonCategory.where(semester: Settings.instance.current_semester).sample

      if current_admin.student_reviewer? && current_admin.comparisons.current.count > (100 * ComparisonCategory.count)
        return redirect_to root_path, flash: { success: t('admins.comparisons.almost_done') }
      end

      # Use application_type question for comparison filters
      application_type_question = Question.find_by(tag: "application_type")
      if application_type_question.nil?
        return admin_student_applications_path, flash: { error: "Could not find an application type question"}
      else
        question_filter_id = application_type_question.id
      end

      @comparison = Comparison.new comparison_category: @category
      hold = Hold.where(admin_id: current_admin.id).last
      if hold.nil? || !hold.current?
        if !@category.application_types.nil? && @category.application_types.length > 0

          pool = StudentApplication.comparable.needs_comparison
            .joins(:responses)
            .where(responses: {
              question_id: question_filter_id,
              answer: @category.application_types
            }, current_category: @category.name)
        else
          pool = StudentApplication.comparable.needs_comparison.where(current_category: @category.name)
        end

        needs_comparison = pool.sample(2)
        @left = needs_comparison.first

        if @left.nil?
          return redirect_to admin_student_applications_path, flash: { error: t('admins.comparisons.insufficient')}
        elsif needs_comparison.count > 1
          @right = needs_comparison.second
        else
          if !@category.application_types.nil? && @category.application_types.length > 0
            @right = StudentApplication.comparable.remaining.joins(:responses)
            .where(
              responses: {
                question_id: question_filter_id,
                answer: @category.application_types
              }, 
              current_category: @category.name)
            .where.not(id: @left.id).first
          else 
            @right = StudentApplication.comparable.remaining.where(current_category: @category.name).where.not(id: @left.id).first
          end
        end
      else
        puts "Found existing hold, populating with category #{hold.comparison_category.name}"
        @left = hold.left
        @right = hold.right
        @category = hold.comparison_category
        return
      end

      if @right.nil?
        redirect_to admin_student_applications_path, flash: { error: t('admins.comparisons.insufficient')}
      else
        # Sanity check 
        if @left.current_category != @right.current_category
          redirect_to admin_student_applications_path, flash: { error: 'SOMETHING IS HORRIBLY WRONG (current categories don\'t match'}
        end

        Hold.create(admin: current_admin, left: @left, right: @right, comparison_category: @category)
        update_state(@left)
        update_state(@right)
      end
    end

    def update_state(application)
      # TODO: Please make less hack
      
      cur_category_index = STATES.index(application.current_category)
      next_category = !cur_category_index.nil? ? (cur_category_index + 1) % STATES.length : 0
      # if next_category == 3
      #   if application.response_to('application_type').downcase.include?("developer")
      #     next_category = 0
      #   else
      #     next_category = 1
      #   end
      # end
      application.update current_category: STATES[next_category]
    end

    def create
      last_comp_by_user = Comparison.order(:created_at).where(admin: current_admin).last
      if last_comp_by_user && (Time.now - last_comp_by_user.created_at).to_i < 15.seconds
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

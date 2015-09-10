class Admin::FinalDecisionsController < Admin::BaseController
  before_action :load_final_decision

  def reject
    if @final_decision.rejected?
      @final_decision.remove_decision!
    else
      @final_decision.reject!
    end
    redirect_to admin_student_applications_path
  end

  def approve
    if @final_decision.accepted?
      @final_decision.remove_decision!
    else
      @final_decision.accept!
    end
    redirect_to admin_student_applications_path
  end

  protected

  def load_final_decision
    @final_decision = FinalDecision.find params[:id]
  end
end

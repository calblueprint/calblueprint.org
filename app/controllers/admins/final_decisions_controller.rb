module Admins
  class FinalDecisionsController < BaseController
    def approve
      @final_decision = FinalDecision.find params[:id]
      @final_decision.admitted = true
      redirect_to admin_student_applications_path
    end

    def reject
      @final_decision = FinalDecision.find params[:id]
      @final_decision.admitted = false
      redirect_to admin_student_applications_path
    end
  end
end
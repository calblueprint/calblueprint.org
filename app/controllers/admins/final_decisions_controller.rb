module Admins
  class FinalDecisionsController < BaseController
    def reject
      @final_decision = FinalDecision.find params[:id]
      if @final_decision.admitted == false
        @final_decision.admitted = nil
      elsif @final_decision.admitted.nil? || @final_decision.admitted == true
        @final_decision.admitted = false
      end
      @final_decision.save
      redirect_to admin_student_applications_path
    end

    def approve
      @final_decision = FinalDecision.find params[:id]
      if @final_decision.admitted == true
        @final_decision.admitted = nil
      elsif @final_decision.admitted.nil? || @final_decision.admitted == false
        @final_decision.admitted = true
      end
      @final_decision.save
      redirect_to admin_student_applications_path
    end
  end
end

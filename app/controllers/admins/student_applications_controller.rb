module Admins
  class StudentApplicationsController < BaseController
    def index
      @student_applications = StudentApplication.all
    end
  end
end

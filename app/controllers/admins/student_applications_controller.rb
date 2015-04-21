module Admins
  class StudentApplicationsController < BaseController
    def index
      @student_applications = StudentApplication.all
      @season = @student_applications.first.semester.season
      @year = @student_applications.first.semester.year
      
      respond_to do |format|
        format.html
        format.csv do
          headers['Content-Disposition'] = "attachment; filename=\"Student-Applications-" + @season + @year + "\""
          headers['Content-Type'] ||= 'text/csv'
        end
      end
    end

    def import
      StudentApplication.import(params[:file])
    end
  end
end

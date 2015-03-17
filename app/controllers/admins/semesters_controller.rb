module Admins
  class SemestersController < BaseController
    def index
      @semesters = Semester.all
    end

    def show
      @semester = Semester.find params[:id]
    end

    def new
      @semester = Semester.new
    end

    def create
      @semester = Semester.new member_params
      clear_current_semester
      if @semester.save
        redirect_to admin_semesters_path
      else
        render 'new'
      end
    end

    def edit
      @semester = Semester.find params[:id]
    end

    def update
      @semester = Semester.find params[:id]
      clear_current_semester
      if @semester.update_attributes member_params
        redirect_to admin_semesters_path
      else
        render 'edit'
      end
    end

    def clear_current_semester
      if member_params[:is_current_semester]
        Semester.where('is_current_semester').update_all("is_current_semester = 'false'")
      end
    end

    # Destroy is only allowed if the semester has no apps or projects
    # Otherwise, admin should reassign apps and projects and then delete
    def destroy
      @semester = Semester.find params[:id]
      if @semester.apps.exists? || @semester.projects.exists?
        # TODO: display 'cannot delete' error
      else
        @semester.destroy
      end
      redirect_to admin_semesters_path
    end

    private

    def member_params
      params.require(:semester).permit(:season, :year, :is_current_semester)
    end
  end
end

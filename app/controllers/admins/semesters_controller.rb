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
      if @semester.update_attributes member_params
        redirect_to admin_semesters_path
      else
        render 'edit'
      end
    end

    # TODO: Only destroy if semester has no apps or projects
    #       Otherwise, reassign those to different semester before deleting
    def destroy
      # Semester.destroy params[:id]
      # redirect_to admin_semesters_path
    end

    private

    def member_params
      params.require(:semester).permit(:season, :year)
    end
  end
end

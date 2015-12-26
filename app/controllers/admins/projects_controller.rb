module Admins
  class ProjectsController < BaseController
    def index
      @projects = Project.all
    end

    def new
      @project = Project.new
    end

    def create
      @project = Project.new project_params
      if @project.save
        flash[:success] = t "admins.projects.create.success"
        redirect_to admin_projects_path
      else
        render 'new'
      end
    end

    def edit
      @project = Project.find params[:id]
    end

    def update
      @project = Project.find params[:id]
      if @project.update project_params
        flash[:success] = t "admins.projects.update.success"
        redirect_to admin_projects_path
      else
        render 'edit'
      end
    end

    private

    def project_params
      params.require(:project).permit(
        :title, :short_summary, :link, :full_description, :banner_image
      )
    end
  end
end

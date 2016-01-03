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

    # An API method that is used to change a position of a project. It's called
    # from sortable-table.coffee.
    #
    # @param oldPos - The old position of the project
    # @param newPos - The new position of the project
    def change_position
      project = Project.find_by position: params[:oldPos]
      project.insert_at params[:newPos].to_i
      render json: { status: :ok }
    end

    private

    def project_params
      params.require(:project).permit(
        :title, :short_summary, :link, :full_description, :banner_image
      )
    end
  end
end

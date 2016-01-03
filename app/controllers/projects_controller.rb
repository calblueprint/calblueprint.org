class ProjectsController < ApplicationController
  def index
    @projects = Project.published
  end

  def show
    @project = ProjectDecorator.decorate Project.find params[:id]
  end
end

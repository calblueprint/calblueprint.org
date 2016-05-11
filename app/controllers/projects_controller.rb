class ProjectsController < ApplicationController
  def index
    @projects = Project.published.decorate
  end

  def show
    @project = ProjectDecorator.decorate Project.find params[:id]
  end
end

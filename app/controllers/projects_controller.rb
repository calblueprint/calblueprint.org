class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = ProjectDecorator.decorate Project.find params[:id]
  end
end

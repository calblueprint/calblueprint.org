class ProjectsController < ApplicationController
  def index
    all_projects = t("projects.projects_list")
    @current_projects = all_projects.select do |slug, proj|
      proj[:status] == "current"
    end
    @past_projects = all_projects.select do |slug, proj|
      proj[:status] == "past"
    end
  end

  def show
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    begin
      @project = t("projects.projects_list.#{params[:slug]}", raise: true)
    rescue I18n::MissingTranslationData
      not_found
    end
  end
end

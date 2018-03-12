class ProjectsController < ApplicationController
  def show
    unless params[:current]
      @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
      render :show
    end

    slug_to_view = {
      "DREAM" => :dream
    }
    unless slug_to_view.has_key? params[:slug]
      render '/public/404'
    end
    render slug_to_view[params[:slug]]
  end

end

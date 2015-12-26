class ProjectDecorator < ApplicationDecorator
  delegate_all

  def full_description_markdown
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    markdown.render object.full_description
  end
end

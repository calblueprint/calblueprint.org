class ProjectDecorator < ApplicationDecorator
  include Draper::LazyHelpers
  delegate_all

  def full_description_markdown
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    markdown.render object.full_description
  end

  # These are used on the admin side to generate the action icon links
  #
  def action_edit_link
    link_to edit_admin_project_path(object),
            class: 'icon hint--top',
            id: dom_id(object, :edit),
            data: { hint: 'Edit' } do
      fa_icon 'pencil'
    end
  end

  def action_toggle_published_link
    link_to toggle_publish_admin_project_path(object),
            method: :post,
            class: 'icon hint--top',
            id: dom_id(object, :toggle_publish),
            data: { hint: object.published ? 'Unpublish' : 'Publish' } do
      fa_icon object.published ? 'eye-slash' : 'eye'
    end
  end
end

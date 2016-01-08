# == Schema Information
#
# Table name: projects
#
#  id                        :integer          not null, primary key
#  title                     :string
#  short_summary             :string
#  link                      :string
#  created_at                :datetime
#  updated_at                :datetime
#  full_description          :text
#  banner_image_file_name    :string
#  banner_image_content_type :string
#  banner_image_file_size    :integer
#  banner_image_updated_at   :datetime
#  position                  :integer
#  published                 :boolean          default(FALSE)
#

class Project < ActiveRecord::Base
  MISSING_IMAGE_PLACEHOLDER = "http://placehold.it/1024x400"

  default_scope { order 'position' }

  scope :published,   -> { where published: true }
  scope :unpublished, -> { where published: false }

  # See https://github.com/thoughtbot/paperclip#validations for more about these
  has_attached_file :banner_image, default_url: MISSING_IMAGE_PLACEHOLDER
  # rubocop:disable Style/AlignHash
  validates_attachment :banner_image, presence: true,
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  # rubocop:enable Style/AlignHash

  acts_as_list

  validates :title, presence: true
  validates :short_summary, presence: true
  validates :link, presence: true
  validates :full_description, presence: true

  # Methods to publish and unpublish a project.
  # We make sure only the published projects are in the list
  # provided by acts_as_list.
  def toggle_published
    if published?
      unpublish
    else
      publish
    end
  end

  def publish
    update published: true
    move_to_bottom
  end

  def unpublish
    update published: false
    remove_from_list
  end
end

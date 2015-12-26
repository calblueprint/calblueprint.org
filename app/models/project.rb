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
#

class Project < ActiveRecord::Base
  MISSING_IMAGE_PLACEHOLDER = "http://placehold.it/1024x400"

  # See https://github.com/thoughtbot/paperclip#validations for more about these
  has_attached_file :banner_image, default_url: MISSING_IMAGE_PLACEHOLDER
  # rubocop:disable Style/AlignHash
  validates_attachment :banner_image, presence: true,
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  # rubocop:enable Style/AlignHash

  validates :title, presence: true
  validates :short_summary, presence: true
  validates :link, presence: true
  validates :full_description, presence: true
end

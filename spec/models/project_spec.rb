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

require 'rails_helper'

RSpec.describe Project, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :short_summary }
  it { should validate_presence_of :link }
  it { should validate_presence_of :full_description }

  it { should have_attached_file :banner_image }
  it { should validate_attachment_presence :banner_image }
  it do
    should validate_attachment_content_type(:banner_image)
      .allowing('image/png', 'image/gif')
      .rejecting('text/plain', 'text/xml')
  end
end

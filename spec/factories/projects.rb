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

FactoryGirl.define do
  factory :project do
    sequence(:title) { |n| "Project #{n}" }
    short_summary "This is a test project"
    link "http://www.somedemo.com"
    full_description "This is the longer description"
    banner_image File.new("#{Rails.root}/spec/support/fixtures/bpsf.png")
    published false

    factory :published_project do
      published true
    end
  end
end

# == Schema Information
#
# Table name: nonprofit_applications
#
#  id           :integer          not null, primary key
#  nonprofit_id :integer
#  semester_id  :integer
#  created_at   :datetime
#  updated_at   :datetime
#  purpose      :text
#

FactoryGirl.define do
  factory :nonprofit_application do
    nonprofit
    semester
    purpose "Some text."
  end
end

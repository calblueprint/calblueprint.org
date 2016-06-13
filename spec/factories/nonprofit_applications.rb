# == Schema Information
#
# Table name: nonprofit_applications
#
#  id               :integer          not null, primary key
#  nonprofit_id     :integer
#  semester_id      :integer
#  created_at       :datetime
#  updated_at       :datetime
#  purpose          :text
#  history          :text
#  date_established :date
#  legal            :boolean
#  short_summary    :string
#  goals            :text
#  key_features     :text
#  devices          :string
#  target_audience  :text
#  why              :text
#

FactoryGirl.define do
  factory :nonprofit_application do
    nonprofit
    semester
    purpose "Some text."
    history "Some text."
    date_established Time.zone.now.to_date
    legal true
    cs169_pool false
    short_summary "hi"
    goals "many"
    key_features "fun"
    devices ["Desktop", "Mobile phones"]
    target_audience "everyone"
    why "Greatness"
    technical_requirements "none"
  end
end

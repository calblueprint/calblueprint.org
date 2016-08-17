# == Schema Information
#
# Table name: nonprofit_applications
#
#  id                     :integer          not null, primary key
#  nonprofit_id           :integer
#  semester_id            :integer
#  created_at             :datetime
#  updated_at             :datetime
#  purpose                :text
#  history                :text
#  date_established       :date
#  legal                  :boolean
#  short_summary          :string
#  goals                  :text
#  key_features           :text
#  devices                :string
#  target_audience        :text
#  why                    :text
#  cs169_pool             :boolean          not null
#  client_status          :string
#  technical_requirements :text
#  state                  :string           default("draft"), not null
#  submitted_at           :datetime
#

FactoryGirl.define do
  factory :nonprofit_application do
    nonprofit
    semester
    cs169_pool false

    factory :finished_nonprofit_application do
      purpose "Some text."
      history "Some text."
      date_established Time.zone.now.to_date
      legal true
      short_summary "hi"
      goals "many"
      key_features "fun"
      devices ["Desktop", "Mobile phones"]
      target_audience "everyone"
      why "Greatness"
      technical_requirements "none"

      trait :submitted do
        state "submitted"
        submitted_at Time.zone.now
      end

      trait :current do
        semester Settings.instance.current_semester
      end
    end
  end
end

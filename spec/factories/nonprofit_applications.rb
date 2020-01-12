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
#  short_summary          :text
#  goals                  :text
#  key_features           :text
#  devices                :string(255)
#  target_audience        :text
#  why                    :text
#  cs169_pool             :boolean          not null
#  client_status          :string
#  technical_requirements :text
#  state                  :string           default("draft"), not null
#  submitted_at           :datetime
#  current_resources      :text
#  future_plans           :text
#

FactoryGirl.define do
  factory :nonprofit_application do
    nonprofit
    semester
    cs169_pool false

    factory :finished_nonprofit_application do
      purpose FFaker::Lorem.paragraph
      history FFaker::Lorem.paragraph
      date_established Time.zone.now.to_date
      legal true
      short_summary FFaker::Lorem.sentence
      goals FFaker::Lorem.paragraph
      key_features FFaker::Lorem.paragraph
      devices NonprofitApplication::POSSIBLE_DEVICES.sample(2)
      target_audience FFaker::Lorem.paragraph
      why FFaker::Lorem.paragraph
      technical_requirements FFaker::Lorem.paragraph

      trait :submitted do
        state "submitted"
        submitted_at Time.zone.now
      end

      trait :current do
        semester { Settings.instance.current_semester }
      end
    end
  end
end

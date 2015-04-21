FactoryGirl.define do
  factory :settings do
    npo_status "open"
    student_status "open"
    current_semester_id 1
    singleton_guard 0
  end
end

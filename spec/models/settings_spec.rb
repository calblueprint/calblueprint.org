# == Schema Information
#
# Table name: settings
#
#  id                   :integer          not null, primary key
#  created_at           :datetime
#  updated_at           :datetime
#  singleton_guard      :integer
#  current_semester_id  :integer
#  npo_app_open         :boolean
#  student_app_open     :boolean
#  cs169_app_open       :boolean
#  comparison_bonus     :integer          default(0)
#  comparison_penalty   :integer          default(0)
#  comparison_threshold :integer          default(0)
#  applicants_remaining :integer          default(0)
#

require 'rails_helper'

RSpec.describe Settings, type: :model do
  it { should validate_presence_of :current_semester_id }
end

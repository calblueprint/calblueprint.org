# == Schema Information
#
# Table name: settings
#
#  id                  :integer          not null, primary key
#  created_at          :datetime
#  updated_at          :datetime
#  singleton_guard     :integer
#  current_semester_id :integer
#  npo_app_open        :boolean
#  student_app_open    :boolean
#

require 'rails_helper'

RSpec.describe Settings, type: :model do
  it { should validate_presence_of :current_semester_id }
end

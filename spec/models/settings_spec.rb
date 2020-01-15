# == Schema Information
#
# Table name: settings
#
#  id                             :integer          not null, primary key
#  created_at                     :datetime
#  updated_at                     :datetime
#  singleton_guard                :integer
#  current_semester_id            :integer
#  npo_app_open                   :boolean
#  dev_app_open                   :boolean
#  cs169_app_open                 :boolean
#  comparison_bonus               :integer          default(0)
#  comparison_penalty             :integer          default(0)
#  comparison_threshold           :integer          default(0)
#  applicants_remaining           :integer          default(0)
#  external_app_open              :boolean          default(TRUE)
#  npo_statement_of_interest_open :boolean
#  npo_project_proposal_open      :boolean
#  notify_bar_active              :boolean
#  notify_bar_content             :text
#  notify_bar_link                :string
#  designer_app_open              :integer          default("closed")
#

require 'rails_helper'

RSpec.describe Settings, type: :model do
  it { should validate_presence_of :current_semester_id }
end

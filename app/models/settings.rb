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
#  infosession_open               :boolean          default(FALSE)
#  infosession_link_one           :string           default("")
#  infosession_date_one           :datetime
#  infosession_link_two           :string           default("")
#  infosession_date_two           :datetime
#

class Settings < ActiveRecord::Base
  enum designer_app_open: { not_accepting: 0, closed: 1, open: 2 }

  validates :singleton_guard, numericality: 0
  validates :npo_app_open, inclusion: [true, false]
  validates :npo_statement_of_interest_open, inclusion: [true, false]
  validates :npo_project_proposal_open, inclusion: [true, false]
  validates :cs169_app_open, inclusion: [true, false]
  validates :dev_app_open, inclusion: [true, false]
  validates :external_app_open, inclusion: [true, false]
  validates :current_semester_id, presence: true
  validates :infosession_open, inclusion: [true, false]

  def self.instance
    first_or_create npo_app_open: false,
                    npo_statement_of_interest_open: false,
                    npo_project_proposal_open: false,
                    cs169_app_open: false,
                    dev_app_open: false,
                    designer_app_open: 1,
                    external_app_open: false,
                    current_semester_id: Semester.first_or_create(season: :spring, year: '2020').id,
                    notify_bar_active: false,
                    infosession_open: false,
                    singleton_guard: 0
  end

  def current_semester
    Semester.find(current_semester_id)
  rescue ActiveRecord::RecordNotFound
    throw "Current semester ID invalid!"
  end
end

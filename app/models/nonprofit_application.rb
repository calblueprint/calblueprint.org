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
#  cs169_pool       :boolean
#

class NonprofitApplication < ActiveRecord::Base
  scope :current, -> { where(semester: Settings.instance.current_semester, state: 'submitted').order(:submitted_at) }
  scope :cs169_apps, -> { current.where(cs169_pool: true) }
  scope :bp_apps, -> { current.where(cs169_pool: false) }

  POSSIBLE_DEVICES = ["Mobile phones", "Tablets", "Desktops"]
  STATES = ["draft", "submitted"]
  serialize :devices

  belongs_to :nonprofit
  belongs_to :semester

  validates :cs169_pool, inclusion: [true, false], if: -> (na) { na.submitted? }
  validates :nonprofit_id, presence: true
  validates :semester_id, presence: true
  validates :purpose, presence: true, if: -> (na) { na.submitted? }
  validates :history, presence: true, if: -> (na) { na.submitted? }
  validates :date_established, presence: true, if: -> (na) { na.submitted? }
  # legal is validated by database
  validates :short_summary, presence: true, length: { maximum: 255 }, if: -> (na) { na.submitted? }
  validates :goals, presence: true, if: -> (na) { na.submitted? }
  validates :key_features, presence: true, if: -> (na) { na.submitted? }
  validates :devices, presence: true, if: -> (na) { na.submitted? }
  validates :target_audience, presence: true, if: -> (na) { na.submitted? }
  validates :why, presence: true, if: -> (na) { na.submitted? }
  validates :technical_requirements, presence: true, if: -> (na) { na.submitted? }

  CLIENT_STATUSES = ["Yes, my current app works but I want to add more features",
                     "Yes, but the app is not currently in a usable state",
                     "No"]
  validates :client_status, presence: true, if: lambda { |na| na.submitted? && na.cs169_pool? }

  validates :state, inclusion: { in: STATES }, allow_nil: false

  state_machine :state, :initial => :draft do
    event :submit do
      transition :draft => :submitted
    end

    after_transition :draft => :submitted do |nonprofit_application, transition|
      nonprofit_application.update_attributes(submitted_at: Time.now)
    end
  end

  delegate :email, to: :nonprofit
  delegate :organization_name, to: :nonprofit
end

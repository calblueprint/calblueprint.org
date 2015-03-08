class Member < ActiveRecord::Base
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, presence: true

  def self.get_gravatar()
  end
end

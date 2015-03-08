class Member < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true

  def self.get_gravatar()
  end
end

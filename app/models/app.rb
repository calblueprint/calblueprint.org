class App < ActiveRecord::Base
  has_one :identities

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, presence: true
  validates :year, presence: true
end

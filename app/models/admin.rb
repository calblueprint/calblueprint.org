class Admin < ActiveRecord::Base
  devise :invitable, :database_authenticatable, :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
end

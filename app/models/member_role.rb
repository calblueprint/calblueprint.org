class MemberRole < ActiveRecord::Base
  has_many :members

  validates :role, presence: true
  validates_uniqueness_of :role

  def to_label
    "#{role}"
  end

  def can_be_destroyed?
    ! members.exists?
  end
end

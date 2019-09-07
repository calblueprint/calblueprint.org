# == Schema Information
#
# Table name: comparison_categories
#
#  id                 :bigint(8)        not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  weight             :decimal(, )
#  comparison_bonus   :decimal(, )
#  comparison_penalty :decimal(, )
#  name               :string
#  application_types  :text             default([]), is an Array
#  semester_id        :bigint(8)
#

class ComparisonCategory < ActiveRecord::Base
  belongs_to :semester
  has_many :comparison_category_questions
  has_many :questions, through: :comparison_category_questions

  validates :name, presence: true
  validates :comparison_bonus, presence: true
  validates :comparison_penalty, presence: true
  validates :weight, presence: true
end

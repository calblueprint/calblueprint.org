class ComparisonCategory < ActiveRecord::Base
  has_many :comparison_category_questions
  has_many :questions, through: :comparison_category_questions

  validates :name, presence: true
  validates :comparison_bonus, presence: true
  validates :comparison_penalty, presence: true
  validates :weight, presence: true
end

class ComparisonCategoryQuestion < ActiveRecord::Base
  belongs_to :question
  belongs_to :comparison_category
end

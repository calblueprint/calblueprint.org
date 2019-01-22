class CreateComparisonCategoryQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :comparison_category_questions do |t|
      t.references :question, foreign_key: true
      t.references :comparison_category, foreign_key: true

      t.timestamps
    end
  end
end

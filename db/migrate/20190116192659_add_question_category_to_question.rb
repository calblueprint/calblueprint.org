class AddQuestionCategoryToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :question_category, :integer
  end
end

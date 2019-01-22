class AddValidationFieldsToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :word_limit, :integer, default: 0
    add_column :questions, :file_size_limit, :integer, default: 10
    add_column :questions, :input_type, :integer, default: 0
  end
end

class CreateQuestionSemesters < ActiveRecord::Migration[5.2]
  def change
    create_table :question_semesters do |t|
      t.integer :question_order
      t.references :question, foreign_key: true
      t.references :semester, foreign_key: true

      t.timestamps
    end
  end
end

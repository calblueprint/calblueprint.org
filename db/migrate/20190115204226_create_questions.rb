class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :hint
      t.integer :question_type

      t.timestamps
    end
  end
end

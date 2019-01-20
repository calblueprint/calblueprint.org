class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.text :answer
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end

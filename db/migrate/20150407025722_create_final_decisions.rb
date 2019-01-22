class CreateFinalDecisions < ActiveRecord::Migration[4.2]
  def change
    create_table :final_decisions do |t|
      t.boolean :admitted

      t.references :decisionable, polymorphic: true, index: true

      t.timestamps
    end
  end
end

class CreateFinalDecisions < ActiveRecord::Migration
  def change
    create_table :final_decisions do |t|
      t.boolean :admitted

      t.references :decisionable, polymorphic: true, index: true

      t.timestamps
    end
  end
end

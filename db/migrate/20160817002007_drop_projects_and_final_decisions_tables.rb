class DropProjectsAndFinalDecisionsTables < ActiveRecord::Migration[4.2]
  def change
    drop_table :projects
    drop_table :final_decisions
  end
end

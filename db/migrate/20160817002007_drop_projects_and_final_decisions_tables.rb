class DropProjectsAndFinalDecisionsTables < ActiveRecord::Migration
  def change
    drop_table :projects
    drop_table :final_decisions
  end
end

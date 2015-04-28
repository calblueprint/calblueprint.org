class RenameAdmittedToDecision < ActiveRecord::Migration
  def change
    rename_column :final_decisions, :admitted, :decision
    change_column :final_decisions, :decision, :string
  end
end

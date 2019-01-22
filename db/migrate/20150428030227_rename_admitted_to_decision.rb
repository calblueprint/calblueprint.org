class RenameAdmittedToDecision < ActiveRecord::Migration[4.2]
  def change
    rename_column :final_decisions, :admitted, :decision
    change_column :final_decisions, :decision, :string
  end
end

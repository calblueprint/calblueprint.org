class AddNonprofitAppPhasesToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :npo_statement_of_interest_open, :boolean
    add_column :settings, :npo_project_proposal_open, :boolean
  end
end

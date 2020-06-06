class AddCalendlyToNonprofitInterestForm < ActiveRecord::Migration[5.2]
  def change
    add_column :nonprofit_interest_forms, :submitted_calendly, :boolean
  end
end

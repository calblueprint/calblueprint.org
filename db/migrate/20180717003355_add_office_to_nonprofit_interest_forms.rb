class AddOfficeToNonprofitInterestForms < ActiveRecord::Migration[4.2]
  def change
    add_column :nonprofit_interest_forms, :office, :string
  end
end

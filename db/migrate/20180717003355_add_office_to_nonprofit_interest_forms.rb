class AddOfficeToNonprofitInterestForms < ActiveRecord::Migration
  def change
    add_column :nonprofit_interest_forms, :office, :string
  end
end

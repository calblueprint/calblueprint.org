class AddReferrerToNonprofitInterestForms < ActiveRecord::Migration[5.2]
  def change
    add_column :nonprofit_interest_forms, :referrer, :string
  end
end

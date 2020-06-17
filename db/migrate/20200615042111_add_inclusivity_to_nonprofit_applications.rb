class AddInclusivityToNonprofitApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :nonprofit_applications, :inclusivity, :text
  end
end

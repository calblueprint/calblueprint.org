class AddNewQuestionsToNonprofitApplication < ActiveRecord::Migration[5.2]
  def change
    add_column :nonprofit_applications, :current_resources, :text
    add_column :nonprofit_applications, :future_plans, :text
  end
end

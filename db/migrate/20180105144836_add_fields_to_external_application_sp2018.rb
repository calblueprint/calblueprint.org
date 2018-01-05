class AddFieldsToExternalApplicationSp2018 < ActiveRecord::Migration
  def change
    add_column :external_applications, :social_links, :text
    add_column :external_applications, :personal_growth, :text
    add_column :external_applications, :additional_option, :string
  end
end

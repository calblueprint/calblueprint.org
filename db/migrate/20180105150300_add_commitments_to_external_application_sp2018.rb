class AddCommitmentsToExternalApplicationSp2018 < ActiveRecord::Migration
  def change
    add_column :external_applications, :commitments, :text
  end
end

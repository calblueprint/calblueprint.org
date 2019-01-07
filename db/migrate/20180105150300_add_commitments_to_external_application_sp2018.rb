class AddCommitmentsToExternalApplicationSp2018 < ActiveRecord::Migration[4.2]
  def change
    add_column :external_applications, :commitments, :text
  end
end

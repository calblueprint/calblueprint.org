class RemovePasswordFromApplicant < ActiveRecord::Migration
  def change
    remove_column :applicants, :encrypted_password
  end
end

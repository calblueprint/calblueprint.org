class RemovePasswordFromApplicant < ActiveRecord::Migration[4.2]
  def change
    remove_column :applicants, :encrypted_password
  end
end

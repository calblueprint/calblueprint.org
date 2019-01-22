class CreateIdentities < ActiveRecord::Migration[4.2]
  def change
    create_table :identities do |t|
      t.references :applicant, index: true
      t.string :provider
      t.string :uid

      t.timestamps
    end
  end
end

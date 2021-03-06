class CreateProjects < ActiveRecord::Migration[4.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :short_summary
      t.string :overview
      t.string :problem
      t.string :solution
      t.string :link

      t.timestamps
    end
  end
end

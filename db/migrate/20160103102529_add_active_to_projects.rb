class AddActiveToProjects < ActiveRecord::Migration[4.2]
  def change
    add_column :projects, :published, :boolean, default: false
  end
end

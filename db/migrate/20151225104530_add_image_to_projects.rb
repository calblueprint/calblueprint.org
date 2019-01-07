class AddImageToProjects < ActiveRecord::Migration[4.2]
  def change
    add_attachment :projects, :banner_image
  end
end

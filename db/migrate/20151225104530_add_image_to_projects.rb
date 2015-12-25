class AddImageToProjects < ActiveRecord::Migration
  def change
    add_attachment :projects, :banner_image
  end
end

class AddAlumnusToMember < ActiveRecord::Migration[4.2]
  def change
    add_column :members, :is_alumnus, :boolean, default: false
  end
end

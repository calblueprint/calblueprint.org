class AddAlumnusToMember < ActiveRecord::Migration
  def change
    add_column :members, :is_alumnus, :boolean, default: false
  end
end

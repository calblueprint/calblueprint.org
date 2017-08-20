class AddAddToNewsletterStudentApplications < ActiveRecord::Migration
  def change
      add_column :student_applications, :add_to_newsletter, :boolean, default:true
  end
end

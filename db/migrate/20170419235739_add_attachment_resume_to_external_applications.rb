class AddAttachmentResumeToExternalApplications < ActiveRecord::Migration
  def self.up
    change_table :external_applications do |t|
      t.attachment :resume
    end
  end

  def self.down
    remove_attachment :external_applications, :resume
  end
end

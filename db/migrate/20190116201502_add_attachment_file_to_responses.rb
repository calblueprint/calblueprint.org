class AddAttachmentFileToResponses < ActiveRecord::Migration[5.2]
  def self.up
    change_table :responses do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :responses, :file
  end
end

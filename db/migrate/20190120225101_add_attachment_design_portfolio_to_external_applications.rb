class AddAttachmentDesignPortfolioToExternalApplications < ActiveRecord::Migration[5.2]
  def self.up
    change_table :external_applications do |t|
      t.attachment :design_portfolio
    end
  end

  def self.down
    remove_attachment :external_applications, :design_portfolio
  end
end

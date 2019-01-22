class AddDesignPortfolioToStudentApplications < ActiveRecord::Migration[4.2]
  def self.up
      add_attachment :student_applications, :design_portfolio
  end

  def self.down
      remove_attachment :student_applications, :design_portfolio
  end
end

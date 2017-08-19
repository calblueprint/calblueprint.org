class AddDesignPortfolioToStudentApplications < ActiveRecord::Migration
  def self.up
      add_attachment :student_applications, :design_portfolio
  end

  def self.down
      remove_attachment :student_applications, :design_portfolio
  end
end

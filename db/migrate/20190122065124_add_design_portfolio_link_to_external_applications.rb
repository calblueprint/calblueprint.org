class AddDesignPortfolioLinkToExternalApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :external_applications, :design_portfolio_link, :string
  end
end

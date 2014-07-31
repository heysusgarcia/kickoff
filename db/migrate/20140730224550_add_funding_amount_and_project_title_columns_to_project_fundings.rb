class AddFundingAmountAndProjectTitleColumnsToProjectFundings < ActiveRecord::Migration
  def change
    add_column :project_fundings, :project_title, :string
    add_column :project_fundings, :amount_funded, :integer
  end
end

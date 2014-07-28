class RemoveAmountFundedColumnFromProjectFundings < ActiveRecord::Migration
  def change
    remove_column :project_fundings, :amount_funded
  end
end

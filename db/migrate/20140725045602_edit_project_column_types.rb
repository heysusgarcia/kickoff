class EditProjectColumnTypes < ActiveRecord::Migration
  def change
    remove_column :projects, :goal_date
    add_column :projects, :duration, :integer, null: false
    add_column :projects, :website, :text
    add_column :projects, :category, :string, null: false
  end
end

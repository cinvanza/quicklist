class AddSpentToList < ActiveRecord::Migration[7.1]
  def change
    add_column :lists, :spent, :decimal
  end
end

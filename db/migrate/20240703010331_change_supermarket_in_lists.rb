class ChangeSupermarketInLists < ActiveRecord::Migration[7.1]
  def change
    change_column_null :lists, :supermarket_id, true
  end
end

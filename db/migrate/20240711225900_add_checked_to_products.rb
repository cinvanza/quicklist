class AddCheckedToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :checked, :boolean
  end
end

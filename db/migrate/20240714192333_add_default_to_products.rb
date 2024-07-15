class AddDefaultToProducts < ActiveRecord::Migration[7.1]
  def change
    change_column_default :products, :checked, from: nil, to: false
  end
end

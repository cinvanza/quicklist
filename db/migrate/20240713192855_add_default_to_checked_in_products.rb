class AddDefaultToCheckedInProducts < ActiveRecord::Migration[7.1]
  def change
    change_column :products, :checked, :boolean, default: false
  end
end

class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand
      t.decimal :price
      t.integer :quantity
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end

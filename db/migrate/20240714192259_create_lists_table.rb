class CreateListsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :lists do |t|
      t.string :name
      t.date :date
      t.integer :access_type
      t.float :budget
      t.integer :status
      t.decimal :spent, precision: 8, scale: 2, default: 0.0
      t.references :tag, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :supermarket, null: true, foreign_key: true

      t.timestamps
    end
  end
end

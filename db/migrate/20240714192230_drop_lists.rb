class DropLists < ActiveRecord::Migration[7.1]
  def change
    drop_table :lists, force: :cascade
  end
end

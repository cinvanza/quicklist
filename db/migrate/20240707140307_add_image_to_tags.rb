class AddImageToTags < ActiveRecord::Migration[7.1]
  def change
    add_column :tags, :image, :string
  end
end



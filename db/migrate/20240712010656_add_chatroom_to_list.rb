class AddChatroomToList < ActiveRecord::Migration[7.1]
  def change
    add_reference :lists, :chatroom, null: true, foreign_key: true

    reversible do |dir|
      dir.up do
        # Update existing records with a default value or appropriate logic
        List.update_all(chatroom_id: 1) # replace `1` with the appropriate default chatroom_id
      end
    end

    change_column_null :lists, :chatroom_id, false
  end
end

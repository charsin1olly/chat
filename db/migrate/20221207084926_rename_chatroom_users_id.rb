class RenameChatroomUsersId < ActiveRecord::Migration[6.1]
  def change
    rename_column :chatroom_users, :users_id, :user_id
  end
end

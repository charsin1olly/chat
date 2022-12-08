class Chatroom < ApplicationRecord
  
  has_many :chatroom_users
  has_many :users, through: :chatroom_users
  # has_many :users, through: :chatroom_users, source: :user

  has_many :messages


end

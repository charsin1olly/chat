# class ChatroomUsersController < ApplicationController
#   before_action :authenticate_user!
#   before_action :set_chatroom
  
#   def create
#     # render html:params
#     @chatroom_user = @chatroom.chatroom_users.where(user_id: current_user.id).first_or_create
#     redirect_to @chatroom

#   end

#   def destroy
#     @chatroom_user=@chatroom.chatroom_users.where(user_id: current_user.id).destroy_all
#     redirect_to chatrooms_path
#   end

#  private
#   def set_chatroom
#     @chatroom=Chatroom.find(params[:chatroom_id])
#   end

#   def find_chatroom_user
#     @chatroom_user=@chatroom.chatroom_users.find(user_id: current_user.id)
#   end
# end

class ChatroomUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatroom
  before_action :find_chatroom_user, only: [:create ]
  
  def create
    # render html:params
    # @chatroom_user.first_or_create
    @chatroom_user.create
    redirect_to @chatroom

  end

  def destroy
    @chatroom_user.destroy_all
    redirect_to chatrooms_path
  end

 private
  def set_chatroom
    @chatroom=Chatroom.find(params[:chatroom_id])
  end

  def find_chatroom_user
    @chatroom_user=@chatroom.chatroom_users.where(user_id: current_user.id)
  end
end
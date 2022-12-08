# class ChatroomUsersController < ApplicationController
#   before_action :authenticate_user!
#   before_action :set_chatroom
  
#   def create
#     # render html:params
      #first_or_create可以確保只添加一次（已存在就不再多寫)
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
  before_action :set_chatroom, only: [:create ,:destroy]
  
  def create
    @chatroom_user = @chatroom.chatroom_users.find_or_create_by(user_id: current_user.id)
    redirect_to @chatroom
  end

  def destroy
    # 直接從本體找本體（路過through）
    current_user.chatrooms.delete(@chatroom)

    # wrong number of arguments (given 0, expected 1)
    # @chatroom.chatroom_users.where(user_id: current_user.id).destroy

    # 另一種寫法(從第三方表格去找)
    # @chatroom.chatroom_users.find_by(user_id: current_user.id).delete
    
    redirect_to chatrooms_path
  end

 private
  def set_chatroom
    @chatroom = Chatroom.find(params[:chatroom_id])
  end

end
class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatroom

  def new
    @message=@chatroom.messages.new
  end

  def create
    @message=@chatroom.messages.new(messages_params)
    @message.user=current_user

    if @message.save
      notice: "已傳送"
    else
      notice: "發送失敗"
    end
  end

  private
  def set_chatroom
    @chatroom = Chatroom.find(params[:chatroom_id])
  end

  def messages_params
    params.require(:message).permit(:body)
  end
end

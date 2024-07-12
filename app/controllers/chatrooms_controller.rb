class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:list_id])
    @message = Message.new
  end
end

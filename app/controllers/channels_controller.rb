class ChannelsController < ApplicationController
  def show
    @channel = Channel.find(params[:id])
    @chatroom_message = ChatroomMessage.new
  end
end

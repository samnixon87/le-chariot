class ChannelsController < ApplicationController
  def show
    @channel = Channel.find(params[:id])
    @chatroom_message = ChatroomMessage.new
  end

  def index
    @channels = Channel.all
  end
end

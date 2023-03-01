class ChannelsController < ApplicationController
  def show
    # @channel = Channel.find(params[:id])
    @issue = Issue.find(params[:id])
    @message = Message.new
  end

  def index
    @channels = Channel.all
  end
end

class ChannelsController < ApplicationController
  def show
    @channel = Channel.find(params[:id])
    @issues = Issue.where(channel_id: @channel.id)
    @issue = Issue.new
    @message = Message.new
  end
end

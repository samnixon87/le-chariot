class ChannelsController < ApplicationController
  def show
    @channels = Channel.all
    @channel = Channel.find(params[:id])
    @issues = @channel.issues
    @issue = @issues.order(:created_at).first
    @message = Message.new
  end
end

class ChannelsController < ApplicationController
  def show
    @channels = Channel.all
    @channel = Channel.find_by(slug: params[:slug])
    @issues = @channel.issues
    @issue = @issues.order(:created_at).first
    @message = Message.new
    @disable_footer = true
  end
end

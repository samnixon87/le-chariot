class ChannelsController < ApplicationController
  def show
    @channels = Channel.all
    @channel = Channel.find_by(slug: params[:slug])
    @issues = Issue.left_outer_joins(:messages).distinct.select('issues.*, COUNT(messages.*) AS messages_count').where(channel: @channel).group('issues.id').order(messages_count: :desc)
    @issue = @issues.order(:created_at).first
    @message = Message.new
    @disable_footer = true
  end
end

class IssueChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    issue = Issue.find(params[:id])
    stream_for issue
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

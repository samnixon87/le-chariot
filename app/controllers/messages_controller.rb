class MessagesController < ApplicationController
  def create
    @issue = Issue.find(params[:issue_id])
    @message = Message.new(message_params)
    @message.issue = @issue
    @message.user = current_user
    if @message.save
      IssueChannel.broadcast_to(
      @issue,
      render_to_string(partial: "messages/message", locals: {message: @message})
      )
      head :ok
      # redirect_to chatroom_path(@chatroom)
    else
      render "issues/show", status: :unprocessable_entity
    end
  end

  def pinned
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end

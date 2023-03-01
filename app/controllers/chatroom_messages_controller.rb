class ChatroomMessagesController < ApplicationController
  def create
    @channel = Channel.find(params[:channel_id])
    @chatroom_message = ChatroomMessage.new(chatroom_message_params)
    @chatroom_message.channel = @channel
    @chatroom_message.user = current_user
    if @chatroom_message.save
      ChannelChannel.broadcast_to(
      @channel,
      render_to_string(partial: "chatroom_messages/chatroom_message", locals: {message: @chatroom_message})
      )
      head :ok
    else
      render "channels/show", status: :unprocessable_entity
    end
  end

  private

  def chatroom_message_params
    params.require(:chatroom_message).permit(:content)
  end
end

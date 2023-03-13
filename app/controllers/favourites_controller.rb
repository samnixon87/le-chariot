class FavouritesController < ApplicationController
  def create
    @message = Message.find(params[:message_id])
    @message.favourites.create!(user: current_user)

    respond_to do |format|
      format.html { redirect_to message_path(@message) }
      format.json
    end
  end
end

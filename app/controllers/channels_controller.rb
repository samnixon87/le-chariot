class ChannelsController < ApplicationController
  def show
    @channel = Channel.find(params[:id])
  end
end

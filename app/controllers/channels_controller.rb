class ChannelsController < ApplicationController
  def show
    @channel = Channel.find(params[:id])
  end

  def index
    @channels = Channel.all
  end
end

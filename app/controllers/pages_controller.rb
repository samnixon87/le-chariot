class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :chat ]
  before_action :set_api_key, only: [:ai_request]
  require 'securerandom'
  def home
    @uuid = SecureRandom.uuid
  end

  def ai_request
    AiRequestJob.perform_later(ai_request_params, @api_key)
  end

  def chat
    @channels = Channel.all
    @issue = Issue.find(1)
    @message = Message.new
    @issues = Issue.all
  end

  private

  def ai_request_params
    params.require(:ai_request).permit(:prompt, :ai_model, :uuid)
  end

  def set_api_key
    @api_key = ENV["SECRET_KEY"]
  end

end

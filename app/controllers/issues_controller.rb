class IssuesController < ApplicationController
  def create
    @channel = Channel.find(params[:channel_id])
    @issue = Issue.new(issue_params)
  end

  def show
    @issue = Issue.find(params[:id])
  end

  def index
    @issues = Issue.all
  end

  private

  def issue_params
    params.require(:issue).permit(:content, :description, :rating, :user_id, :created_at, :updated_at, :channel_id)
  end
end

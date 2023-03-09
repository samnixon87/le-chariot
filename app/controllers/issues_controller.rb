class IssuesController < ApplicationController
  def new
    @user = current_user
    @issue = Issue.new
  end

  def create
    # @channels = Channel.all
    @user = current_user
    @issue = Issue.new(issue_params)
    @issue.user = current_user
    if @issue.save
      # @channel = Channel.find(params[:channel_id])
      # @issue.channel = @channel
      redirect_to channel_issue_path(:channel_id, :id), notice: "Issue created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @channel = Channel.find(params[:channel_id])
    @issue = Issue.find(params[:id])
    @message = Message.new
    @channels = Issue.all
  end

  def index
    @channel = Channel.find(params[:channel_id])
    @issues = Issue.all
  end

  private

  def issue_params
    params.require(:issue).permit(:description, :title, :rating, :channel_id, :user_id, :code_block)
  end
end

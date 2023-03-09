class IssuesController < ApplicationController
  def new
    @user = current_user
    @issue = Issue.new
  end

  def create
    # @channel = Channel.find(params[:channel_id])
    # @channels = Channel.all
    @user = current_user
    @issue = Issue.new(issue_params)
    @issue.user = current_user
    # @issue.channel = @channel
    if @issue.save
      redirect_to user_path(current_user), notice: "Issue created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @channel = Channel.find(params[:channel_id])
    @issue = Issue.find(params[:id])
    @message = Message.new
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

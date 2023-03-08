class IssuesController < ApplicationController
  def new
    @channel = Channel.find(params[:channel_id])
    @issue = Issue.new(issue_params)
  end

  def create
    @user = current_user
    @issue = Issue.new(issue_params)
    @issue.user_id = current_user.id
    @issue.user_id = User.find(params[:user_id]).id
    if @issue.save
      redirect_to user_path(current_user), notice: "Issue successful!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @channel = Channel.find(params[:channel_id])
    @issue = Issue.find(params[:id])
  end

  def index
    @channel = Channel.find(params[:channel_id])
    @issues = Issue.all
  end

  private

  def issue_params
    params.require(:issue).permit(:content, :description, :rating, :user_id, :created_at,
                                  :updated_at, :channel_id, :title, :code_block)
  end
end

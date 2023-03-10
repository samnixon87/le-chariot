class IssuesController < ApplicationController
  def index
    @channel = Channel.find(params[:channel_id])
    @issues = @channel.issues
    respond_to do |format|
      if params[:query].present?
        @issues = @issues.search_by_title_and_description(params[:query])
        format.html
        format.text { render partial: "issues/list", locals: { issues: @issues }, formats: [:html] }
      else
        format.html
      end
    end
  end

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
    @issues = Issue.all
  end

  private

  def issue_params
    params.require(:issue).permit(:description, :title, :rating, :channel_id, :user_id, :code_block)
  end
end

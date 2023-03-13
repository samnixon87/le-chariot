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
    if params[:channel_id]
      @channel = Channel.find(params[:channel_id])
    end
    @user = current_user
    @issue = Issue.new
  end

  def create
    @issue = Issue.new(issue_params)
    if params[:channel_id]
      @channel = Channel.find(params[:channel_id])
      @issue.channel = @channel
    end
    # @channels = Channel.all
    @user = current_user
    @issue.user = current_user
    if @issue.save
      # @channel = Channel.find(params[:channel_id])
      redirect_to channel_path(@issue.channel), notice: "Issue created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @channel = Channel.find(params[:channel_id])
    @channels = Channel.all
    @message = Message.new
    @issue = Issue.find(params[:id])
    @issues = Issue.all
  end

  private

  def issue_params
    params.require(:issue).permit(:description, :title, :rating, :channel_id, :user_id, :code_block)
  end
end

class CommentsController < ApplicationController

  def index
    @job_application = JobApplication.find(params[:job_application_id])
    @comments = Comment.All
  end

  def new
   @comment = Comment.new 
  end 

  def create
    @job_application = JobApplication.find(params[:job_application_id])
    @comment = Comment.new(comment_params)
    @comment.job_application = @job_application
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to job_application_path(@job_application), notice: "Comment was successfully created." }
      else
        format.html { redirect_to job_application_path(@job_application) }
      end
    end
  end

  def comment_params
    params.require(:comment).permit(:job_application_id, :user_id, :content)
  end

end

class CommentsController < ApplicationController

  def create
    # @application = Application.find(params[:application_id])
    # authorize @Application
    # @comment = Comment.new(comment_params)
    # authorize @comment
    # @comment.application = @application
    # @comment.user = current_user
    # if @comment.save
    #   respond_to do |format|
    #     format.html { redirect_to application_show_path(@application) }
    #     format.json { render json: { message_html: render_to_string( partial: '/comments/comment.html.erb', locals: { comment: @comment })}}
    #   end
    # else
    #   render 'application/show.html.erb'
    # end
  end

  # def comment_params
  #   params.require(:comment).permit(:content)
  # end

end

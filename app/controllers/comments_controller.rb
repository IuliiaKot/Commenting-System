class CommentsController < ApplicationController
  before_action :find_commentable

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    if @comment.save
      redirect_to :back, notice: "Comment was successfully posted"
    else
      redirect_to :back, notice: "Comment wasn't posted"
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end

    def find_commentable
      @commentable = (Comment.find_by(id: params[:comment_id]) || Story.find_by(id: params[:story_id]))
    end
end

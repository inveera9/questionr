class CommentsController < ApplicationController
  before_filter :require_admin, only: [:index, :update, :destroy]
  skip_before_filter :verify_authenticity_token  
  
  def index
    @comments = Comment.order("created_at desc")
  end

  def create
    if params[:candidate_id].present?
      candidate = Candidate.includes(:campaign).find(params[:candidate_id])
      comment = candidate.comments.new(comment_params)
      if comment.save
        render json: comment
      else
        render json: {errors_message: "Unable to create comment"}
      end
    else
      redirect_to candidates_path
    end

  end

  def update
    comment = Comment.find(params[:id])
    comment.status = comment.status ? false : true
    if comment.save
      redirect_to comments_path
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to comments_path  
  end

  private
    def comment_params
      params.require(:comment).permit(:title, :message)
    end
end

class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    if producer_signed_in?
      @comment.producer_id = current_producer.id
    elsif buyer_signed_in?
      @comment.buyer_id = current_buyer.id
    else
      redirect_to root_path
    end
    if @comment.save
      if producer_signed_in?
        @post.create_notification_comment!(current_producer, @comment.id)
      elsif buyer_signed_in?
        @post.create_notification_comment!(current_buyer, @comment.id)
      end
      # respond_to :js
      redirect_to request.referrer
    else
    #もし非同期でコメントをsaveした場合
    # render :index
      redirect_to request.referrer
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    #もし非同期でコメントをsaveした場合
    #render 'index'
    redirect_to request.referrer
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id, :producer_id, :buyer_id)
  end
end

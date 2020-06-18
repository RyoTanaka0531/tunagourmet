class LikesController < ApplicationController
  before_action :require_signed_in

  def create
    @post = Post.find(params[:post_id])
    if producer_signed_in?
      like = current_producer.likes.build(post_id: params[:post_id])
    elsif buyer_signed_in?
      like = current_buyer.likes.build(post_id: params[:post_id])
    end
    like.save
    # 通知処理
    if producer_signed_in?
      @post.create_notification_by_producer(current_producer)
    elsif buyer_signed_in?
      @post.create_notification_by_buyer(current_buyer)
    end
    respond_to do |format|
      format.html {redirect_to request.referrer}
      format.js
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    if producer_signed_in?
      like = Like.find_by(post_id: params[:post_id], producer_id: current_producer.id)
    elsif buyer_signed_in?
      like = Like.find_by(post_id: params[:post_id], buyer_id: current_buyer.id)
    end
    like.destroy
  end

  private
  def require_signed_in
    unless signed_in?
      flash[:error] = "新規登録またはログインをしてください"
      redirect_to sign_up_path
    end
  end
end

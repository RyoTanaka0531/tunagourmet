class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    if producer_signed_in?
      like = current_producer.likes.build(post_id: params[:post_id])
    elsif buyer_signed_in?
      like = current_buyer.likes.build(post_id: params[:post_id])
    end
    like.save
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
end

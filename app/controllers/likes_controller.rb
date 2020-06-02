class LikesController < ApplicationController
  def create
    if producer_signed_in?
      like = current_producer.likes.build(post_id: params[:post_id])
    elsif buyer_signed_in?
      like = current_buyer.likes.build(post_id: params[:post_id])
    end
    like.save
    redirect_to posts_path
    # @post = Post.find(params[:post_id])
    # if producer_signed_in?
    #   @like = current_producer.likes.build(post_id: params[:post_id])
    # else
    #   @like = current_buyer.likes.build(post_id: params[:post_id])
    # end
    # like.save
  end
  
  def destroy
    if producer_signed_in?
      like = Like.find_by(post_id: params[:post_id], producer_id: current_producer.id)
    elsif buyer_signed_in?
      like = Like.find_by(post_id: params[:post_id], buyer_id: current_buyer.id)
    end
    like.destroy
    redirect_to posts_path
    # @post = Post.find(params[:post_id])
    # if producer_signed_in?
    #   like = Like.find_by(post_id: params[:post_id], producer_id: current_producer.id)
    # elsif buyer_signed_in?
    #   like = Like.find_by(post_id: params[:post_id], buyer_id: current_buyer.id)
    # end
    # like.destroy
  end
end

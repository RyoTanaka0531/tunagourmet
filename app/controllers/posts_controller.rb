class PostsController < ApplicationController
  def create
    if producer_signed_in?
      #producerがログインしてたらproducer_idを、buyerがログインしてたらbuyer_idを@postに入れる
      @post = Post.new(post_producer_params)
      @post.producer_id = current_producer.id
    elsif buyer_signed_in?
      @post = Post.new(post_buyer_params)
      @post.buyer_id = current_buyer.id
    else
      redirect_to root_path
    end

    @post.save!
      redirect_to post_path(@post)
  end

  def index
    @post = Post.new
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_buyer_params
    params.require(:post).permit(:buyer_id, :heading, :content, :image)
  end

  def post_producer_params
    params.require(:post).permit(:producer_id, :heading, :content, :image)
  end
end


class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.producer_id = current_producer.id
    @post.buyer_id = current_producer.id
    if @post.save
      redirect_to posts_path
    else
      render 'show'
    end
  end

  def index
    @post = Post.new
    @posts = Post.all
  end

  def show
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:content, :buyer_id, :producer_id)
  end
end

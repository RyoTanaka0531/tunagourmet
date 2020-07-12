class PostsController < ApplicationController
  before_action :require_signed_in, except: [:index, :show]
  impressionist unique: [:session_hash]

  def create
    if producer_signed_in?
      # producerがログインしてたらproducer_idを、buyerがログインしてたらbuyer_idを@postに入れる
      @post = Post.new(post_producer_params)
      @post.producer_id = current_producer.id
    elsif buyer_signed_in?
      @post = Post.new(post_buyer_params)
      @post.buyer_id = current_buyer.id
    else
      redirect_to root_path
    end
    if @post.save
      redirect_to post_path(@post)
    else
      flash[:notice] = "題名、または本文に空欄があります、もう一度ご入力ください。"
      redirect_to request.referrer
    end
  end

  def index
    @post = Post.new
    @posts = Post.order(id: "DESC").page(params[:page]).per(6)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.order(created_at: :desc)
    impressionist(@post, nil, unique: [:session_hash])
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

  def require_signed_in
    unless signed_in?
      flash[:error] = "新規登録またはログインをしてください"
      redirect_to sign_up_path
    end
  end
end
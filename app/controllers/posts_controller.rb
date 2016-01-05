class PostsController < ApplicationController
  before_action :is_authenticated?

  def index
    @posts = Post.all
    gon.something = "Hi"
    gon.people = ['Zoe', 'Yani', 'Mal']
    gon.posts = Post.all
  end

  def create
    Post.create post_params
    redirect_to posts_path
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find params[:id]
  end

  def show
    @post = Post.find params[:id]
  end

  def update
    p = Post.find params [:id]
    p.update Post_params
    redirect_to posts_path
  end

  def destroy
    result = Post.destroy params[:id]
    respond_to do |format|
    format.html {redirect_to :posts}
    format.json {render json: result}
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :link, :user_id)
  end

end

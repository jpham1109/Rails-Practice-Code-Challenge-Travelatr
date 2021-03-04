class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :like]

  def index
    @posts = Post.all
  end

  def new
    @errors = flash[:errors]
    @post = Post.new
    @bloggers = Blogger.all 
    @destinations = Destination.all 
  end

  def create
    new_post = Post.create(post_params)
    if new_post.valid?
      redirect_to post_path(new_post)
    else 
      flash[:errors] = new_post.errors.full_messages
      redirect_to new_post_path
    end
  end

  def show
  end

  def edit
    @bloggers = Blogger.all 
    @destinations = Destination.all
  end

  def update
    post.update(post_params)
    redirect_to post_path(post)
  end

  def like
    @post.likes += 1
    @post.save

    redirect_to post_path(@post)
  end 

  private

  def post_params
    params.require(:post).permit(:title, :content, :blogger_id, :destination_id)
  end 

  def find_post
    @post = Post.find(params[:id])
  end 
end

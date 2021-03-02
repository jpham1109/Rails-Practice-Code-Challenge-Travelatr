class BloggersController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def show
    @blogger = Blogger.find(params[:id])
  end

  
end

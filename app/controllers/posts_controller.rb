class PostsController < ApplicationController
  def index
    @posts = Post.find(:all)
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(params[:post])
    post.save
    redirect_to :action => 'index'
  end
end

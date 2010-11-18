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

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(params[:post])
    redirect_to :action => 'index'
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to :action => 'index'
  end
end

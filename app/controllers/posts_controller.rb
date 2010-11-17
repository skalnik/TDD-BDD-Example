class PostsController < ApplicationController
  def index
    @posts = Post.find(:all)
  end

end

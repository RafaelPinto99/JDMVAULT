class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user, :comments, :likes).order(created_at: :desc)
  end
end

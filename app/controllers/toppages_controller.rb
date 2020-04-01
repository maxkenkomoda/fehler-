class ToppagesController < ApplicationController
  def index
    if logged_in?
      @allposts = Post.all 
      @posts = @allposts.order(id: :desc).page(params[:page]) #表示用
      @selfposts = current_user.posts.order(id: :desc).page(params[:page])
    end
  end
end

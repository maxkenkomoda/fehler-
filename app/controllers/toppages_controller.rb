class ToppagesController < ApplicationController
  def index
    if logged_in?
      @allposts = Post.all
      @posts = @allposts.order(id: :desc).page(params[:page]).per(12) #表示用
    else
      @allposts = Post.all
      @sampleposts = @allposts.order(id: :desc).page(params[:page]).per(12)#ログイン前表示用
    end
  end
end

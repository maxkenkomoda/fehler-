class ApplicationController < ActionController::Base
  
  include SessionsHelper
  
  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(post)
    @count_likes = post.favorites.count
  end

  def get_post
    @post = Post.find(params[:id])
  end

end

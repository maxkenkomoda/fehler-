class ApplicationController < ActionController::Base
  
  include SessionsHelper
  
  def counts(post)
    @count_likes = post.favorites.count
  end
  
  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  

  
end

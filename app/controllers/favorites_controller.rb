class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    other_post = Post.find(params[:post_id])
    current_user.like(other_post)
    flash[:success] = 'Fehlerをお気に入りしました。'
    redirect_to controller: :posts, action: :show, id: other_post
  end

  def destroy
    other_post = Post.find(params[:post_id])
    current_user.unlike(other_post)
    flash[:danger] = 'Fehlerをお気に入りから外しました。'
    redirect_to controller: :posts, action: :show, id: other_post
  end
end

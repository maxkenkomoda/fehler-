class PostsController < ApplicationController
  before_action :require_user_logged_in
  
  def new
    @post = Post.new
  end
  
  def create
    @posts = Post.all
    @post = current_user.posts.build(post_params)
    
    if @post.save
      flash[:sucess] = 'あなたのFehlerを投稿しました。'
      redirect_to root_url
    else
      flash[:danger] = 'あなたのFehlerを投稿することができませんでした。'
      render :new
      
    end
  end

  def destroy
  end

  def update
  end

  def show
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :content, :settle)
  end
end

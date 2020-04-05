class PostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy, :update]
  before_action :get_post, only: [:show, :edit, :update]
  
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
    @post.destroy
    flash[:success] = 'あなたのFehlerを削除しました。'
    redirect_to root_url
  end

  def edit
    get_post
  end  

  def update
    get_post

    if @post.update(post_params)
      flash[:success] = 'あなたのFehlerを編集しました。'
      redirect_to root_url
    else
      flash[:danger] = "あなたのFehlerを編集できませんでした。"
      render :edit
    end
  end

  def show
    get_post
    counts(@post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :settle)
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_url
    end
  end
end
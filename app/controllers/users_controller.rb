class UsersController < ApplicationController
  before_action :require_user_logged_in, only:[:index, :show]
  before_action :get_user, only:[:index, :show]
  
  def index
    get_user
  end
  
  def show
    get_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:sucess] ="ユーザーを登録しました。"
      redirect_to @user
      
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  private
  
  #パラメータ
  def get_user
    @user = User.find(params[:id])
    @post = @user.posts.order(id: :desc).page(params[:page]).per(12)
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :job, :birthday, :gender)
  end
end

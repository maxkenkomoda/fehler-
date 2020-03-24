class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    #@birhday = User.select("birthday")
    
    #年齢計算用のコード
    #now = Date.today
    
    #@age = now.strftime("%Y%m%d") - @birthday.strftime("%Y%m%d")
    
  end

  def new
  end

  def create
  end
end

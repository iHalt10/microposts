class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  def show # 追加
   @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    #@user.age =(Date.today.strftime("%Y%m%d").to_i - @user.birthday.strftime("%Y%m%d").to_i) / 10000
    if @user.update(update_user_params)
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to root_path , notice: '編集しました'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  private
  def update_user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :gender, :birthday)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end
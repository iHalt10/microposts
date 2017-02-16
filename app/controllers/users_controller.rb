class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def show # 追加
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
      redirect_to @user , notice: '編集しました'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def update_user_params
    # p = user_param
    # p.permit(:gender, :birthday)
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :gender, :birthday)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def correct_user
    # current_user = 私
    # @user =編集対象のユーザー
    redirect_to root_url if current_user != @user
  end
end
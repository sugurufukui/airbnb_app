class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]

def index
  @user = User.find_by(params[:id])
end

def show
  @user = User.find(params[:id])
end

def new
  @user = User.new
end

def create
  @user = User.new(user_params)
  @user.avatar.attach(params[:user][:avatar])

  if @user.save
    log_in @user
    flash[:success] = "ようこそ！！"
    redirect_to @user
  else
    render 'new'
  end
end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

      if @user.update(user_params)
        flash[:success] = "アカウントを更新しました"
        redirect_to user_path(@user.id)
      else
        render 'edit'
      end
  end


end

private

  def user_params
    params.require(:user).permit(:name, :email, :description, :avatar, :password, :password_comfirmation)
  end


#beforeアクション

  def logged_in_user
    unless logged_in?
      flash[:danger] = "ログインしてください"
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_url unless @user == current_user
  end

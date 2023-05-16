class UsersController < ApplicationController
  
  protect_from_forgery
  before_action :authenticate_user!,except: [:index,:show]
  before_action :set_q, only: [:index,:search]

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def account
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to users_path, alert: '不正なアクセスです'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "#{@user.id}の情報を更新しました"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def search
    @results = @q.result
  end

  private
  
  def set_q
    @q = User.ransack(params[:q])
  end


  def user_params
    params.require(:user).permit(:profileimage, :username, :profile)
  end

end

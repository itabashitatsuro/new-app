class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @name = user.name
    @diaries = user.diaries
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: '登録ができました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

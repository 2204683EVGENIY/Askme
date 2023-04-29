class UsersController < ApplicationController
  def new
    session[:current_time] = Time.now

    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    session[:user_id] = @user.id
    redirect_to root_path, notice: 'Вы успешно зарегистрировались!'
  end

  def user_params
    params.require(:user).permit(
      :name, :nickname, :email, :password
    )
  end
end

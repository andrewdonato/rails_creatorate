class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    @user.password = user_params[:password]
    @user.save!
  end

  def login
    @user = User.find_by_email(params[:email])
    if @user.password == params[:password]
      give_token
    else
      redirect_to home_url
    end
  end

  def forgot_password
    @user = User.find_by_email(params[:email])
    random_password = Array.new(10).map { (65 + rand(58)).chr }.join
    @user.password = random_password
    @user.save!
    Mailer.create_and_deliver_password_change(@user, random_password)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end

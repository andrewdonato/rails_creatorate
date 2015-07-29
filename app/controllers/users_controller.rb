class UsersController < ApplicationController
  def new
  end

  def index

  end

  def create
    @user = User.new(user_params)
    @user.password = user_params[:password]
    @user.save
    session[:user_id] = @user.id

    redirect_to root_path
  end

  def login
    @user = User.find_by_email(params[:email])
    if @user.password == params[:password]
      session[:user_id] = @user.id
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

  def logout
    session[:user_id] = nil
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end



end

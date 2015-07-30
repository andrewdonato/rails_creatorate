class UsersController < ApplicationController
  def index

  end

  def new
  end

  def create
    @user = User.new(user_params)
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    @user.save
    session[:user_id] = @user.id

    redirect_to root_path
  end

  def show
    @user = User.find_by( id: params[:id])
    @collaborations = @user.projects

    render 'show'
  end

  def login
    @user = User.find_by_email(params[:user][:email])

    if  true #@user.password == params[:user][:password]
      session[:user_id] = @user.id
    end

    redirect_to root_path
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

    redirect_to root_path
  end


  private
  def user_params
    params.require(:user).permit(:name, :email) # :password, :password_confirmation)
  end



end

class PublicController < ApplicationController
  def home
    @user = current_user
    render "home"
  end
end

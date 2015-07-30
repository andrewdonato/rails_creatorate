class ProjectsController < ApplicationController

  def create
    @user =  current_user
    @project = Project.new(project_params)
    @project.creator_id = @user.id
    if @project.save
      redirect_to user_project_path @user, @project
    end
  end

  def show
    @user = current_user
    @project = Project.find(params[:id])
    @creator = User.find_by(id: @project.creator_id)
    render 'show'
  end

  def collaborate
    @project = Project.find(params[:id])
    @user = current_user
    @project.users << @user

    render json: @user
  end

  private

  def project_params
    params.require(:project).permit(:name, :timeframe, :finances, :description, :needs) # :password, :password_confirmation)
  end
end

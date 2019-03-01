class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_permitted
  before_action :get_user, only: [:edit, :update, :destroy, :show]

  def index
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.password = "password"
    case current_user.role.name
      when "admin"
        @user.role = Role.find_by(name: "hod")
      when "faculty"
        @user.role = Role.find_by(name: "student")
      else
        @user.role
    end
    @user.save
    redirect_to users_path
  end

  def edit
  end

  def new
    @user = User.new
  end

  def show
  end

  def destroy
    @user.destroy
    if @user.destroy
        redirect_to root_url, notice: "User deleted."
    end
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: "User is updated successfully"
    else
      render action: "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :role_id, :department_id, :semester_id)
  end

  def get_user
    @user = User.find(params[:id])
  end

  def ensure_permitted
    redirect_to root_path and return if !(current_user.role.name == "admin" || current_user.role.name == "hod" || current_user.role.name == "faculty")
  end
end

class Admin::UsersController < Admin::MainController
  before_action :get_user, only: [:edit, :update, :destroy]

  def index
    @users = User.order('name asc').where(hod: true)
  end

  def create
    user = User.new(user_params)
    user.password = 'password'
    user.role = 'faculty'
    user.hod = true
    user.save
    redirect_to admin_users_url, notice: 'HOD added successfully'
  end

  def edit; end

  def new
    @user = User.new
  end

  def show; end

  def destroy
    if @user.destroy
      redirect_to admin_users_url, notice: 'HOD removed successfully' 
    else
      redirect_to admin_users_url, info: 'Please try again'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_url, notice: 'HOD details updated successfully'
    else
      render action: 'edit', info: 'Please try again'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :department_id)
  end

  def get_user
    @user = User.find(params[:id])
  end
end

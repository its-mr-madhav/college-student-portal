class Hod::UsersController < Hod::MainController
  before_action :get_user, only: [:edit, :update, :destroy, :show]

  def index
    @faculties = User.order('name asc').where("role = ? AND department_id = ? AND id != ?", "faculty", current_user.department.id, current_user.id)
    @students = User.order('name asc').where("role = ? AND department_id = ? AND id != ?", "student", current_user.department.id, current_user.id)
  end

  def create
    user = User.new(user_params)
    user.password = 'password'
    user.department = current_user.department
    user.save
    redirect_to admin_users_url, notice: 'User with role HOD created successfully'
  end

  def edit; end

  def new
    @user = User.new
  end

  def show; end

  def destroy
    redirect_to admin_users_url, notice: 'HOD removed' if @user.destroy
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_url, notice: 'HOD details updated successfully'
    else
      render action: 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :role, :semester_id)
  end

  def get_user
    @user = User.find(params[:id])
  end
end

class Faculty::UsersController < Faculty::MainController
  before_action :get_user, only: [:edit, :update, :destroy]

  def index
    @students = User.order('name asc').where("role = ? AND department_id = ?", 'student', current_user.department.id)
  end

  def create
    user = User.new(user_params)
    user.password = 'password'
    user.role = 'student'
    if user.save
      flash[:notice] = 'Student added successfully'
      redirect_to faculty_users_url
    else
      flash[:error] = 'Some error occurred'
      render action: 'new'
    end
  end

  def edit; end

  def new
    @user = User.new
  end

  def show; end

  def destroy
    if @user.destroy
      redirect_to faculty_users_url, notice: 'Student removed successfully' 
    else
      redirect_to faculty_users_url, info: 'Please try again'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to faculty_users_url, notice: 'Student details updated successfully'
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

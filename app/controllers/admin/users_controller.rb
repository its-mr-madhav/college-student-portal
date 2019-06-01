class Admin::UsersController < Admin::MainController
  before_action :get_user, only: [:edit, :update, :destroy]

  def index
    @users = User.order('name asc').where(hod: true)
  end

  def create
    @user = User.new(user_params)
    @user.password = 'password'
    @user.role = 'faculty'
    @user.hod_department_id = @user.department_id
    @user.hod = true
    if @user.save
      flash[:notice] = 'HOD added successfully'
      redirect_to admin_users_path
    else
      flash[:error] = "Can't add HOD because #{@user.errors.full_messages.to_sentence.downcase}"
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
      redirect_to admin_users_path, notice: 'HOD removed successfully' 
    else
      redirect_to admin_users_path, info: 'Please try again'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: 'HOD details updated successfully'
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

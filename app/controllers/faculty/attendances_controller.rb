class Faculty::AttendancesController < Faculty::MainController
  before_action :get_attendance, only: [:edit, :update]

  def index
    @students = User.where(role: 'student').where(department_id: current_user.department_id)
  end

  def create
    attendance = Attendance.new(attendance_params)
    attendance.save
    redirect_to faculty_attendances_url, notice: 'Attendance added successfully'
  end

  def edit; end

  def new
    @attendance = Attendance.new
  end

  def show; end

  def destroy
    # if @user.destroy
    #   redirect_to faculty_users_url, notice: 'HOD removed successfully' 
    # else
    #   redirect_to faculty_users_url, info: 'Please try again'
    # end
  end

  def update
    # if @user.update(user_params)
    #   redirect_to faculty_users_url, notice: 'HOD details updated successfully'
    # else
    #   render action: 'edit', info: 'Please try again'
    # end
  end

  private

  def attendance_params
    params.require(:attendance).permit(:present, :lecture_id, :student_id)
  end

  def get_attendance
    @attendance = Attendance.find(params[:id])
  end
end

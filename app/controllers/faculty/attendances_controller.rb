class Faculty::AttendancesController < Faculty::MainController
  skip_before_action :verify_authenticity_token, only: [:update]
  before_action :get_student, only: [:update]

  def index
    @students = User.where(role: 'student').where(department_id: current_user.department_id)
  end

  def update
    attendances = @user.attendances.where("DATE(created_at) = ?", Date.today)
    if attendances.blank?
      attendance = Attendance.new(present: true, user_id: @user.id, lecture_id: 1)
      attendance.save
      render json: {present: true}
    elsif attendances.first[:present] == false
      attendances.first[:present] = true
      attendances.first.save
      render json: {present: true}
    else
      attendances.first[:present] = false
      attendances.first.save
      render json: {present: false}
    end
  end

  private

  def get_student
    @user ||= User.find(params[:id])
  end
end

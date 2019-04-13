class Admin::SemestersController < Admin::MainController
  before_action :get_semester, only: [:edit, :update, :destroy]

  def index
    @semesters = Semester.all
  end

  def create
    @semester = Semester.new(semester_params)
    @semester.save
    redirect_to admin_semesters_url, notice: 'Semester added successfully'
  end

  def edit
    @departments = Department.all.order(:code).pluck(:name, :id)
  end

  def new
    @semester = Semester.new
    @departments = Department.all.order(:code).pluck(:name, :id)
  end

  def show; end

  def destroy
    if @semester.destroy
        redirect_to admin_semesters_url, notice: 'Semester removed successfully'
    else
      redirect_to admin_semesters_url, alert: 'Try again!!!'
    end
  end

  def update
    if @semester.update(semester_params)
      redirect_to admin_semesters_url, notice: 'Semester updated successfully'
    else
      render action: 'edit', alert: 'Try again!!!'
    end
  end

  private

  def semester_params
    params.require(:semester).permit(:name, :department_id)
  end

  def get_semester
    @semester = Semester.find(params[:id])
  end
end

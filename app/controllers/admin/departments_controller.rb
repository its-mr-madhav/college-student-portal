class Admin::DepartmentsController < Admin::MainController
  before_action :get_department, only: [:edit, :update, :destroy]

  def index
    @departments = Department.all
  end

  def create
    @department = Department.new(department_params)
    @department.save
    redirect_to admin_departments_url, notice: 'Department added successfully'
  end

  def edit; end

  def new
    @department = Department.new
    @department.semesters.build
  end

  def show; end

  def destroy
    if @department.destroy
      redirect_to admin_departments_url, notice: 'Department deleted successfully'
    else
      redirect_to admin_departments_url, alert: 'Try again!!!'
    end
  end

  def update
    if @department.update(department_params)
      redirect_to admin_departments_url, notice: 'Department updated successfully'
    else
      render action: 'edit', alert: 'Try again!!!'
    end
  end

  private

  def department_params
    params.require(:department).permit(:name, :code, semesters_attributes: [:id, :name, :done, :_destroy])
  end

  def get_department
    @department = Department.find(params[:id])
  end
end

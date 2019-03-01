class DepartmentsController < ApplicationController
  before_action :ensure_admin
  before_action :get_department, only: [:edit, :update, :destroy]

  def index
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)
    @department.save
    redirect_to departments_path
  end

  def edit
  end

  def new
    @department = Department.new
  end

  def show
  end

  def destroy
    @department.destroy
    if @department.destroy
        redirect_to root_url, notice: "Department deleted."
    end
  end

  def update
    if @department.update(department_params)
      redirect_to departments_path, notice: "Department is updated successfully"
    else
      render action: "edit"
    end
  end

  private

  def department_params
    params.require(:department).permit(:name, :code)
  end

  def get_department
    @department = Department.find(params[:id])
  end

  def ensure_admin
    redirect_to root_path and return if !(current_user.role.name == "admin")
  end
end

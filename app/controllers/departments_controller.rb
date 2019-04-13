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

  def edit; end

  def new
    @department = Department.new
    @department.semesters.build
  end

  def show; end

  def destroy
    @department.destroy ? redirect_to root_url, notice: 'Department deleted' : redirect_to root_url, alert: 'Try again!!!'
  end

  def update
    @department.update(department_params) ? redirect_to departments_path, notice: 'Department updated successfully' : render action: 'edit'
  end

  private

  def department_params
    params.require(:department).permit(:name, :code, semesters_attributes: [:id, :name, :done, :_destroy])
  end

  def get_department
    @department = Department.find(params[:id])
  end

  def ensure_admin
    redirect_to root_path && return unless current_user.role.name == 'admin'
  end
end

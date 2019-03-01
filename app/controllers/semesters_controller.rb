class SemestersController < ApplicationController
  before_action :ensure_admin
  before_action :get_semester, only: [:edit, :update, :destroy]

  def index
    @semester = Semester.new
  end

  def create
    @semester = Semester.new(semester_params)
    @semester.save
    redirect_to semesters_path
  end

  def edit
  end

  def new
    @semester = Semester.new
  end

  def show
  end

  def destroy
    @semester.destroy
    if @semester.destroy
        redirect_to root_url, notice: "Semester deleted."
    end
  end

  def update
    if @semester.update(semester_params)
      redirect_to semesters_path, notice: "Semester is updated successfully"
    else
      render action: "edit"
    end
  end

  private

  def semester_params
    params.require(:semester).permit(:name, :department_id)
  end

  def get_semester
    @semester = Semester.find(params[:id])
  end

  def ensure_admin
    redirect_to root_path and return if !(current_user.role.name == "admin")
  end
end

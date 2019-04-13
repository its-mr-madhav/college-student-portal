class LecturesController < ApplicationController
  before_action :ensure_hod
  before_action :get_lecture, only: [:edit, :update, :destroy]

  def index
    @lectures = Lecture.all
  end

  def create
    lecture = Lecture.new(lecture_params)
    lecture.save
    redirect_to lectures_path
  end

  def edit; end

  def new
    @lecture = Lecture.new
  end

  def show; end

  def destroy
    @lecture.destroy ? redirect_to root_url, notice: 'Lecture deleted' : redirect_to lectures_path, alert: 'Try Again!!!'
  end

  def update
    @lecture.update(lecture_params) ? redirect_to lectures_path, notice: 'Lecture is updated successfully' : render action: 'edit'
  end

  private

  def lecture_params
    params.require(:lecture).permit(:faculty_id, :faculty_subject_id)
  end

  def lecture
    @lecture = Lecture.find(params[:id])
  end

  def ensure_hod
    redirect_to root_path && return unless current_user.role.name == 'hod'
  end
end

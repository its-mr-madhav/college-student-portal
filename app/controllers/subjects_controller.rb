class SubjectsController < ApplicationController
  before_action :ensure_hod
  before_action :get_subject, only: [:edit, :update, :destroy]

  def index
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    @subject.save
    redirect_to subjects_path
  end

  def edit; end

  def new
    @subject = Subject.new
  end

  def show; end

  def destroy
    redirect_to root_url, notice: 'Subject deleted' if @subject.destroy
  end

  def update
    if @subject.update(subject_params)
      redirect_to subjects_path, notice: 'Subject is updated successfully'
    else
      render action: 'edit'
    end
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :code, :semester_id)
  end

  def get_subject
    @subject = Subject.find(params[:id])
  end

  def ensure_hod
    redirect_to root_path && return unless current_user.role.name == 'hod'
  end
end

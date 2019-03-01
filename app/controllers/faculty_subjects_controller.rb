class FacultySubjectsController < ApplicationController
  before_action :ensure_hod
  before_action :get_faculty_subject, only: [:edit, :update, :destroy]

  def index
    @faculty_subject = FacultySubject.new
  end

  def create
    @faculty_subject = FacultySubject.new(faculty_subject_params)
    @faculty_subject.save
    redirect_to faculty_subjects_path
  end

  def edit
  end

  def new
    @faculty_subject = FacultySubject.new
  end

  def show
  end

  def destroy
    @faculty_subject.destroy
    if @faculty_subject.destroy
        redirect_to root_url, notice: "Faculty Subject deleted."
    end
  end

  def update
    if @faculty_subject.update(faculty_subject_params)
      redirect_to faculty_subjects_path, notice: "Faculty Subject is updated successfully"
    else
      render action: "edit"
    end
  end

  private

  def faculty_subject_params
    params.require(:faculty_subject).permit(:faculty_id, :subject_id)
  end

  def get_faculty_subject
    @faculty_subject = Facultysubject.find(params[:id])
  end

  def ensure_hod
    redirect_to root_path and return if !(current_user.role.name == "hod")
  end
end

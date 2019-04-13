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

  def edit; end

  def new
    @faculty_subject = FacultySubject.new
  end

  def show; end

  def destroy
    redirect_to root_url, notice: 'Faculty Subject deleted' if @faculty_subject.destroy
  end

  def update
    if @faculty_subject.update(faculty_subject_params)
      redirect_to faculty_subjects_path, notice: 'Faculty Subject is updated successfully'
    else
      render action: 'edit'
    end
  end

  def get_subject
    @subjects = []
    if params[:faculty_id].eql?('')
      @subjects << ['Please Select Faculty First', nil]
      render json: {subjects: @subjects}
    else
      faculty_id = params[:faculty_id]
      User.find(faculty_id).subjects.each do |subject|
        @subjects << [subject.name, subject.id]
      end
      render json: {subjects: @subjects}
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
    redirect_to root_path and return unless current_user.role.name == 'hod'
  end
end

class Hod::FacultySubjectsController < Hod::MainController
  before_action :get_faculty_subject, only: [:edit, :update, :destroy]

  def index
    @faculty_subject = FacultySubject.where(department_id: current_user.department_id)
  end

  def create
    @faculty_subject = FacultySubject.new(faculty_subject_params)
    if @faculty_subject.save
      flash[:notice] = 'Faculty Subject Added Successfully'
      redirect_to hod_faculty_subjects_path(@faculty_subject)
    else
      flash[:error] = @faculty_subject.errors.full_messages.to_sentence
      render action: 'new'
    end
  end

  def edit; end

  def new
    @faculty_subject = FacultySubject.new
  end

  def show; end

  def destroy
    redirect_to hod_faculty_subjects_path, flash[:notice] = 'Faculty Subject deleted Successfully' if @faculty_subject.destroy
  end

  def update
    if @faculty_subject.update(faculty_subject_params)
      redirect_to hod_faculty_subjects_path, notice: 'Faculty Subject updated successfully'
    else
      flash[:error] = @faculty_subject.errors.full_messages.to_sentence
      render action: 'edit'
    end
  end

  private

  def faculty_subject_params
    params.require(:faculty_subject).permit(:faculty_id, :faculty_subject_id)
  end

  def get_faculty_subject
    @faculty_subject = FacultySubject.find(params[:id])
  end
end

class Hod::SubjectsController < Hod::MainController
  before_action :get_subject, only: [:edit, :update, :destroy]

  def index
    @subjects = Subject.where(department_id: current_user.department_id)
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      flash[:notice] = 'Subject Added Successfully'
      redirect_to hod_subjects_path(@subject)
    else
      flash[:error] = @subject.errors.full_messages.to_sentence
      render action: 'new'
    end
  end

  def edit; end

  def new
    @subject = Subject.new
  end

  def show; end

  def destroy
    redirect_to hod_subjects_path, flash[:notice] = 'Subject deleted Successfully' if @subject.destroy
  end

  def update
    if @subject.update(subject_params)
      redirect_to hod_subjects_path, notice: 'Subject updated successfully'
    else
      flash[:error] = @subject.errors.full_messages.to_sentence
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
end

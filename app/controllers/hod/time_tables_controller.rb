class Hod::TimeTablesController < Hod::MainController
  before_action :get_time_table, only: [:edit, :update, :destroy]

  def index
    @time_tables = TimeTable.all
    @lectures = Lecture.all
  end

  def create
    time_table = TimeTable.new(time_table_params)
    if time_table.save
      flash[:notice] = 'Time Table Created successfully'
      redirect_to hod_time_tables_path
    else
      flash[:error] = time_table.errors.full_messages.to_sentence
      render action: 'new'
    end
  end

  def edit; end

  def new
    @time_table = TimeTable.new
  end

  def show; end

  def destroy
    redirect_to hod_time_tables_path, notice: 'Time Table deleted successfully' if @time_table.destroy
  end

  def update
    if @time_table.update(time_table_params)
      flash[:notice] = 'Time Table updated successfully'
      redirect_to hod_time_tables_path
    else
      flash[:error] = @time_table.errors.full_messages.to_sentence
      render action: "edit"
    end
  end

  private

  def time_table_params
    params.require(:time_table).permit(:faculty_id, :faculty_subject_id)
  end

  def time_table
    @time_table = TimeTable.find(params[:id])
  end
end

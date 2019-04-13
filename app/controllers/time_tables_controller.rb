class TimeTablesController < ApplicationController
  before_action :ensure_hod
  before_action :get_time_table, only: [:edit, :update, :destroy]

  def index
    @time_tables = TimeTable.all
  end

  def create
    time_table = TimeTable.new(time_table_params)
    time_table.save
    redirect_to time_tables_path
  end

  def edit
  end

  def new
    @time_table = TimeTable.new
  end

  def show
  end

  def destroy
    if @time_table.destroy
      redirect_to root_url, notice: "Time Table deleted."
    else
      redirect_to time_tables_path, alert: "Try Again!!!"
    end
  end

  def update
    if @time_table.update(time_table_params)
      redirect_to time_tables_path, notice: "Time Table is updated successfully"
    else
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

  def ensure_hod
    redirect_to root_path, alert: "Not Authorised!!!" and return unless current_user.role.name == "hod"
  end
end

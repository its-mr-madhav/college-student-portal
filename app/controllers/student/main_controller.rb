class Student::MainController < ApplicationController
  include Student::MainHelper

  before_action :authenticate_user!
  before_action :ensure_student

  private

  def ensure_student
    redirect_to root_path, alert: "You are not a student!!!" and return unless current_user.role.eql?('student')
  end
end

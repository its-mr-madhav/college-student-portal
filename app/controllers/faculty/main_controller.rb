class Faculty::MainController < ApplicationController
  include Faculty::MainHelper

  before_action :authenticate_user!
  before_action :ensure_faculty

  private

  def ensure_faculty
    redirect_to root_path, alert: "You are not a faculty!!!" and return false unless current_user.role.eql?('faculty')
  end
end

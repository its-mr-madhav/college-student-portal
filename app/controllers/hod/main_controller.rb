class Hod::MainController < ApplicationController
  include Hod::MainHelper

  before_action :authenticate_user!
  before_action :ensure_hod

  private

  def ensure_hod
    redirect_to root_path, alert: "You are not an HOD!!!" and return unless current_user.hod?
  end
end

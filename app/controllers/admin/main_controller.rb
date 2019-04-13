class Admin::MainController < ApplicationController
  include Admin::MainHelper
  before_action :authenticate_user!
  before_action :ensure_admin

  private

  def ensure_admin
    redirect_to root_path, alert: "You are not an admin!!!" and return unless current_user.role.eql?('admin')
  end
end

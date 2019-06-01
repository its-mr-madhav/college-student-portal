class ApplicationController < ActionController::Base
  
  protected  
  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_path
    elsif resource.faculty? && resource.hod? 
      hod_path
    elsif resource.faculty? && !resource.hod?
      faculty_path
    elsif resource.student?
      student_path
    end
  end
end

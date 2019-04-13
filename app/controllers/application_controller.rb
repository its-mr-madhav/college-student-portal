class ApplicationController < ActionController::Base
  
  protected  
  def after_sign_in_path_for(resource)
    if resource.role.eql?('admin')
      admin_path
    elsif resource.role.eql?('faculty') && resource.hod? 
      hod_path
    elsif resource.role.eql?('faculty') && !resource.hod?
      faculty_path
    elsif resource.role.eql?('student')
      student_path
    end
  end
end

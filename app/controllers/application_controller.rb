class ApplicationController < ActionController::Base
  
  def current_user
    @current_user ||= Employer.find_by_id session[:employer_id]
  end

  def user_signed_in?
    @current_user.present?
  end
  helper_method :user_signed_in?

  def authenticate_user!
    flash[:danger] = "Sign in before uploading CSV!"
    redirect_to new_session_path inless user_signed_in?
  end

end

class ApplicationController < ActionController::Base
  protect_from_forgery

  # before_filter :check_session

  protected

  def check_session
  	unless User.find_by_id(session[:user_id])
  		redirect_to login_url, notice: "Please log in to use app."
  	end
  end
  
end

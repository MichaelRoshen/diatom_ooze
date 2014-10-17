class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :clear_session

  def clear_session
  	session[:user_id] = nil if User.find_by_id(session[:user_id]).nil?
  end
end

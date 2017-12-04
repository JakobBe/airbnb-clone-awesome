class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  attr_reader :current_user
  helper_method :current_user

  def current_user
      @current_user ||= current_registration.try(:registration)
    end

end

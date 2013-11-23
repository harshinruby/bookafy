class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  before_filter :configure_permitted_parameters, if: :devise_controller?
  around_filter :user_time_zone, if: :current_user
  # make expire_on method available for all the controllers
  #def remaining_days
  #  ((current_user.created_at + 30.days).to_time - Time.now).round
  #end
  #def trial_expired?
  #  #now that you have remaining_days, check whether trial period is already completed
  #  if remaining_days <= 0
  #   redirect_to expires_path, notice: "Ur expired"
  #  end
  #end
  #helper_method :all
  #helper_method :remaining_days
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit! }
  end
  
  def after_sign_in_path_for(resource)
      "/calendar"
  end    
  
  private
  
  def load_client
    @client = Client.find_by_business_name!(request.subdomain)
  end 
  
  def current_facebooker
    @current_facebooker ||= Facebooker.find(session[:facebooker_id]) if session[:facebooker_id]
  end
  
  def user_time_zone(&block)
    Time.use_zone(current_user.time_zone , &block)
  end  
  
  helper_method :current_facebooker
  
end

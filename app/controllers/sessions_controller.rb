class SessionsController < ApplicationController
  def create
    facebooker = Facebooker.from_omniauth(env["omniauth.auth"])
    session[:facebooker_id] = facebooker.id
    redirect_to root_url
  end

  def destroy
    session[:facebooker_id] = nil
    redirect_to root_url
  end
end
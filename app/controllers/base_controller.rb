class BaseController < ApplicationController

  def index
    if params[:user]
      session[:user] = params[:user]
      session[:pass] = params[:pass]
    elsif !session[:user]
      redirect_to :action => :login
    end
    
    
  end
  
end

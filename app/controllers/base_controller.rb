class BaseController < ApplicationController

  def index
    if params[:user]
      session[:user] = params[:user]
      session[:pass] = params[:pass]
      
    elsif !session[:user]
      redirect_to :action => :login
    end
    @github = GitHub.new(session[:user], session[:pass])
    
  end
  
  def login
    render :layout => false if request.xhr?
  end  
  
  
  def commits
    @commits = []
    params[:branch].split(",").each do |branch_value|
      new_commits = GitHub.commits(params[:owner],params[:repo],branch_value)    
      new_commits.each do |commit|
        commit.tree = branch_value
      end
      @commits = @commits + new_commits
    end
    render :layout => false
  end
  
  def commit
    data = self.get_data_from_url(params[:url])
    @commit = GitHub.commit(data[0],data[1],data[2])        
    render :layout => false if request.xhr?
  end
  
  def get_data_from_url(url)
    #"0/1mojombo/2grit/3commit/4b8a3d3b374630ba94cd1efab13a2eceadf8d2bf4",
    data = url.split("/")
    values = []
    values[0] = data[1]
    values[1] = data[2]
    values[2] = data[4]
    values
  end
  
end

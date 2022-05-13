class SessionsController < ApplicationController
  def new
    employers = Employer.all
    @names = []
    employers.each do |e|
      @names << e.name
    end
  end

  def create
    
    @employer = Employer.find_by_name params[:name]
    if @employer && @employer.authenticate(params[:password])
      session[:employer_id] = @employer.id
      redirect_to root_path, notice: "Logged in"
    else
      flash[:alert] = "Wrong password"
      render :new
    end
  end

  def destroy
    session[:employer_id] = nil
    redirect_to root_path, notice: "Logged out"
  end
end

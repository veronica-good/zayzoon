class EarningsController < ApplicationController

  def index
    @earnings = Earning.all
    @current_user = current_user
  end

  def import
    Earning.import(params[:file], current_user.id)
    redirect_to root_url, notice: "Data Imported"
  end
end

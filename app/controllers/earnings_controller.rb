class EarningsController < ApplicationController

  def index
    @earnings = Earning.all
  end

  def import
    puts Earning.import(params[:file])
    redirect_to root_url, notice: "Data Imported"
  end
end

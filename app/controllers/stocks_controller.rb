class StocksController < ApplicationController

  def search
    if params[:stock].present?
      @akcija = Stock.new_lookup(params[:stock])
      if @akcija
        render 'users/my_portfolio'
      else
        flash[:alert] = "Please enter a valid symbol search"
        redirect_to my_portfolio_path
      end
    else
      flash[:alert] = "Please enter a symbol to search"
      redirect_to my_portfolio_path
    end
  end

end
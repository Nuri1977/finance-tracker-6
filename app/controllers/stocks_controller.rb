class StocksController < ApplicationController

  def search
    if params[:stock].present?
      @akcija = Stock.new_lookup(params[:stock])
      if @akcija
        respond_to do |format|
          format.js { render partial: 'users/result'}
        end
      else
        respond_to do |format|
          flash.now[:alert] = "Please enter a valid symbol search"
          format.js { render partial: 'users/result'}
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = "Please enter a symbol search"
        format.js { render partial: 'users/result'}
      end
    end
  end

end
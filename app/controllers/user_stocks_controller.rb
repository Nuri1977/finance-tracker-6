class UserStocksController < ApplicationController

  def create
    akcija = Stock.check_db(params[:ticker])
    if akcija.blank?
      akcija = Stock.new_lookup(params[:ticker])
      akcija.save
    end
      @korisnik_akcija = UserStock.create(user: current_user, stock: akcija)
      flash[:notice] = "Stock #{akcija.name} was successufully added to your portfolio"
      redirect_to my_portfolio_path
  end

  def destroy
    akcija = Stock.find(params[:id])
    korisnik_akcija = UserStock.where(user_id: current_user.id, stock_id: akcija.id).first
    korisnik_akcija.destroy
    flash[:notice] = "#{akcija.ticker} was successfully removed from portfolio"
    redirect_to my_portfolio_path
  end
  
end

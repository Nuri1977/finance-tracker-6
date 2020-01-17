class UsersController < ApplicationController
  def my_portfolio
    @prateni_akcii = current_user.stocks
  end
end

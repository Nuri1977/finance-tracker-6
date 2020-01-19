class UsersController < ApplicationController
  def my_portfolio
    @prateni_akcii = current_user.stocks
    @user = current_user
  end

  def my_friends
    @friendships = current_user.friends
  end

  def search
    @users = User.search(params[:search_param])
    render json: @users
  end

end

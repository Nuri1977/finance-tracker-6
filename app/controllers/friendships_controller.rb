class FriendshipsController < ApplicationController
  def create
    shoku = User.find(params[:friend])
    current_user.friendships.build(friend_id: shoku.id)
    if current_user.save
      flash[:notice] = "Following friend"
    else
      flashh[:alert] = "There was something wrong with the tracking request"
    end
    redirect_to my_friends_path
  end

  def destroy
    @drugar = current_user.friendships.where(friend_id: params[:id]).first
    @drugar.destroy
    flash[:notice] = "Stopped following a friend"
    redirect_to my_friends_path

  end
end

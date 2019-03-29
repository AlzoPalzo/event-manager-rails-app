class FriendsController < ApplicationController

    def new
    
    end

    def create
        byebug
        Friend.create(friend_params)
        redirect_to user_path(current_user)
    end

    def accept
        # byebug
        params[:user_ids].each do |user_id|
            request = Friend.find_by(user_id: user_id, friend_id: current_user.id)
            request.accepted = true
            request.save

            Friend.create(user_id: current_user.id, friend_id: user_id, accepted: true)
        end
    end 

    private

    def friend_params
        params.require(:friend).permit(:user_id, :friend_id)
    end
end

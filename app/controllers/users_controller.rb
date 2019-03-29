class UsersController < ApplicationController
  helper_method :find_friend
  before_action :find_user, only: [:show, :edit, :update]
  before_action :authentication_required, except: [:new, :create]

  def home
    redirect_to new_user_path
  end

  def new
    if logged_in?
      redirect_to user_path(current_user)
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
        redirect_to @user
    else
      flash[:user_error] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def show
    @users = User.all.select{|user| user.id != current_user.id}

    #show page user friends
    @friends = @user.friends.select{|friend| friend.accepted == true}
    @friend_ids = @friends.map {|friend| friend.friend_id}

    #requests that current user sees on his own page
    @requests = Friend.all.select{|friend| friend.friend_id == current_user.id && friend.accepted == false}

    #requests current user has made
    @requested_friends = current_user.friends.select{|friend| friend.accepted == false} 
    @requested_friend_ids = @requested_friends.map{|friend| friend.friend_id}
    
    #requests made to the current user
    @requests_ids = @requests.map{|friend| friend.user_id}

    #current_user friends
    @current_user_friends = current_user.friends.select{|friend| friend.accepted == true}
    @current_user_friends_ids = @current_user_friends.map{|friend| friend.friend_id}
    
    @all_current_user_friend_relationship_ids = (@requested_friend_ids + @requests_ids + @current_user_friends_ids).uniq.delete_if{|x| x == nil}
    
    @non_friends = User.all.select{|user| !@all_current_user_friend_relationship_ids.include?(user.id) && user.id != current_user.id}
    # byebug
    # @all_current_user_friend_relationships = @all_current_user_friend_relationship_ids.map{|id| find_friend(id)}
    
    # @non_friends = @users - @all_current_user_friend_relationships
    
  end

  def edit

  end

  def update
    @user.update(user_params)
    if @user.valid?
      redirect_to @user
      flash[:update_success] = "Profile successfully updated!"
    else
      flash[:user_error] = @user.errors.full_messages
      redirect_to edit_user_path
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :age, :bio, :password)
  end

  def find_friend(id)
    @friend = User.find(id)
  end
end

class OccasionsController < ApplicationController
  before_action :find_occasion, only: [:show, :edit, :update, :new_attendee]
  before_action :current_user_friends, only: [:edit, :new]

  def show
    @my_messages = @occasion.messages.reverse
    @location = @occasion.location
    @admin = User.find(@occasion.user_id)
  end

  def new
    @occasion = Occasion.new
  end

  def create
    @occasion = Occasion.new(occasion_params)
    if @occasion.save
      redirect_to @occasion
    else
      flash[:occasion_error] = @occasion.errors.full_messages
      redirect_to new_occasion_path
    end
  end

  def edit
  end

  def new_attendee
    UserOccasion.create(occasion_id: @occasion.id, user_id: current_user.id)
    redirect_to @occasion
  end

  def update
    @occasion.update(occasion_params)
    if @occasion.valid?
      redirect_to @occasion
    else
      flash[:occasion_error] = @occasion.errors.full_messages
      redirect_to new_occasion_path
    end
  end

  def index
    @occasions = Occasion.all.select {|occasion| occasion.public_event == true}.sort_by{|occasion| occasion.date_time}
  end

  private

  def find_occasion
    @occasion = Occasion.find(params[:id])
  end

  def occasion_params
    p = params.require(:occasion).permit(:name, :user_id, :date_time, :description, :public_event, user_ids: [])

    location = Location.find_or_create_by(address: params[:occasion][:address])
    location_id = location.id

    p[:location_id] = location_id
    return p

  end

  def current_user_friends
    @friends_objects = current_user.friends.select{|friend| friend.accepted == true}
    @users = @friends_objects.map{|friend| User.find(friend.friend_id)} 
  end
end

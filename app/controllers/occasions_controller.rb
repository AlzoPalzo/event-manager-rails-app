class OccasionsController < ApplicationController
  before_action :find_occasion, only: [:show, :edit, :update]

  def show
    @my_messages = @occasion.messages.reverse
    @location = @occasion.location
    @admin = User.find(@occasion.user_id)
  end

  def new
    @occasion = Occasion.new
    @users = User.all
    @locations = Location.all
  end

  def create
    byebug
    @occasion = Occasion.new(occasion_params)
    if @occasion.save
      redirect_to @occasion
    else
      flash[:occasion_error] = @occasion.errors.full_messages
      redirect_to new_occasion_path
    end
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
end

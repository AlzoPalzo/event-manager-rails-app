class OccasionsController < ApplicationController
  before_action :find_occasion, only: [:show, :edit, :update]

  def show
    @my_messages = @occasion.messages.reverse
    @locations = Location.all
  end

  def new
    @occasion = Occasion.new
    @users = User.all
    @locations = Location.all
  end

  def create
    #byebug
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
    p = params.require(:occasion).permit(:name, :user_id, :date_time, :description, user_ids: [], locations_attributes: [:name, :description, :rating, :address])
    location_ids = []
    if params[:occasion][:start_location] != ""
      location_ids[0] = find_location_id(params[:occasion][:start_location])
    elsif params[:occasion][:end_location] != ""
      location_ids[1] = find_location_id(params[:occasion][:end_location])
    end
    p[:location_ids] = location_ids
    return p
  end

  #move below logic to model?
  def find_location_id(location_string_rating)
    @location_name = location_string_rating.slice(0...-6)
    @location_id = Location.find_by(name: @location_name).id
  end

end

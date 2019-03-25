class OccasionsController < ApplicationController
  before_action :find_occasion, only: [:show, :edit, :update]

  def show
    @my_messages = @occasion.messages.reverse
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

  private

  def find_occasion
    @occasion = Occasion.find(params[:id])
  end

  def occasion_params
    params.require(:occasion).permit(:name, :user_id, :date_time, :description, user_ids: [])
  end
end

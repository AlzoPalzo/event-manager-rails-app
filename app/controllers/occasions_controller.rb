class OccasionsController < ApplicationController
  before_action :find_occasion, only: [:show]

  def show

  end

  private

  def find_occasion
    @occasion = Occasion.find(params[:id])
  end

  def occasion_params
    params.require(:occasion).permit(:name, :user_id, :date_time, :description)
  end
end

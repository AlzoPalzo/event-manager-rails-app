class LocationsController < ApplicationController
    before_action :find_location, only: [:show]

    def show
    
    end

    private
    def find_location
        @location = Location.find(params[:id])
    end
end

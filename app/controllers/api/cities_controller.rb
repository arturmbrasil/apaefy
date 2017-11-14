module Api
  class CitiesController < ApplicationController
    def index
      @cities = State.find(params['state_id']).cities

      render json: @cities
    end
  end
end

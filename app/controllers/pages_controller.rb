class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :location_results, :results, :about]
  def home
  end

  def results
    @results = Pet.main_search(params[:query])
  end

  def location_results
    coordinates = Geocoder.coordinates(params[:query])
    @results = Pet.near(coordinates, 50)
  end

end

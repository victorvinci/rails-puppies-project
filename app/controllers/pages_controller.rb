class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :results, :about]
  def home
  end

  def results
    @results = Pet.main_search(params[:query])
  end



end

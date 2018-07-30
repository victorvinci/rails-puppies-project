class PetsController < ApplicationController

  before_action :set_pet, only: [:show, :update, :edit, :destroy]

  def index
    @pets = Pet.all
  end

  def show

  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def set_pet

  end

  def pet_params

  end

end

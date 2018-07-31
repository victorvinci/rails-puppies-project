class PetsController < ApplicationController
  before_action :set_user
  before_action :set_pet, only: [:show, :update, :edit, :destroy]
  before_action :owner?, only: [:update, :edit, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @pets = policy_scope(Pet)
  end

  def show
  end

  def new
    @pet = Pet.new
    @pet.owner = @user
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.owner = @user
    require 'pry'; byebug
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @pet.update(pet_params)
      redirect_to pet_path(@pet), notice: 'Pet was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @pet.destroy
    redirect_to pets_path, notice: "Your bet has been put down :("
  end


  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def pet_params
    params.require(:pet).permit(:name, :species, :address, :size, :details, :photo, :photo_cache, :remove_photo)
  end


end

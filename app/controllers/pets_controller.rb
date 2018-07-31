class PetsController < ApplicationController
  before_action  :set_user
  before_action :set_pet, only: [:show, :update, :edit, :destroy]
  before_action :owner?, only: [:update, :edit, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @pets = Pet.all
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
    if @pet.save
      redirect_to @pet
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @pet.update(pet_params)
      redirect_to @pet, notice: 'Pet was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @pet.owner == current_user
      @pet.destroy
      redirect_to pets_path, notice: "Your bet has been put down :("
    else
      redirect_to pets_path, notice: "Only the owner can put down this good boy"
    end
  end


  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def pet_params
    params.require(:pet).permit(:name, :species, :photo, :address, :size, :details)
  end

  #Check run so that user can't spoof URLs
  def owner?
    @pet.owner == current_user
  end

end

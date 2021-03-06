class PetsController < ApplicationController
  before_action :set_user, only: [:new, :create]
  before_action :set_pet, only: [:show, :update, :edit, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @pets = policy_scope(Pet)
  end

  def show

      @marker = [
        {
          lat: @pet.latitude,
          lng: @pet.longitude
          # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
        }]
  end

  def new
    @pet = Pet.new
    @pet.owner = @user
    authorize @pet
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.owner = @user
    authorize @pet
    if @pet.save
      redirect_to pet_path(@pet), notice: "Your pet is now in our database and is able to find new friends!!!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @pet.update(pet_params)
      redirect_to pets_path, notice: 'Pet was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @pet.destroy
    redirect_to pets_path, notice: "Your bet has been put down :("
  end

  def show_bookings
    @bookings = Pet.find(params[:pet_id]).bookings
    authorize @bookings
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
    authorize @pet
  end

  def set_user
    @user = current_user
  end

  def pet_params
    params.require(:pet).permit(:name, :species, :address, :size, :details, :photo, :photo_cache, :remove_photo)
  end


end

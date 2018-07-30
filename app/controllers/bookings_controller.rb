class BookingsController < ApplicationController
  before_action :set_user
  before_action :set_booking, only: [:show, :update, :edit]

  def show
  end

  def new
    @booking = Book.new
    @pet = Pet.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
      if @pet.save
        redirect_to @booking
      else
        render :new
      end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'Booking made. Enjoy your pet.'
    else
      render :edit
    end
  end


  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def pet_params
    params.require(:booking).permit(:booking_start, :booking_end, :status)
  end

end

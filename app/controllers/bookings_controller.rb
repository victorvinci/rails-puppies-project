class BookingsController < ApplicationController
  before_action :set_user
  before_action :set_booking, only: [:show, :update, :edit]

  def show
  end

  def index
    @bookings = policy_scope(Booking)
  end

  def new
    @booking = Booking.new
    authorize @booking
    @pet = Pet.find(params[:pet_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.pet = Pet.find(params[:pet_id])
    @booking.user = @user
    @booking.status = "pending"
    authorize @booking
    if @booking.save
      redirect_to pet_path(@booking.pet), notice: 'Booking made. Enjoy your pet.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to pet_path(@booking.pet), notice: 'Booking changed. Enjoy your pet.'
    else
      render :edit
    end
  end

  def accept_booking
    @booking = Booking.find(params[:booking_id])
    authorize @booking
    @booking.status = 'accepted'
    @booking.save
    redirect_to show_bookings_path(@booking.pet), notice: 'Accepted!'
  end

  def reject_booking
    @booking = Booking.find(params[:booking_id])
    authorize @booking
    @booking.status = 'rejected'
    @booking.save
    redirect_to show_bookings_path(@booking.pet), notice: 'Rejected!'
  end

  def cancel_booking
    @booking = Booking.find(params[:booking_id])
    authorize @booking
    @booking.status = 'canceled'
    @booking.save
    redirect_to bookings_path, method: :put, notice: 'Accepted!'
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def set_user
    @user = current_user
  end

  def booking_params
    params.require(:booking).permit(:booking_start, :booking_end, :status)
  end

end

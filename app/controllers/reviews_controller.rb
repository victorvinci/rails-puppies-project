class ReviewsController < ApplicationController
  before_action :set_user
  before_action :set_review, only: [:show, :update, :edit, :destroy]
  before_action :set_booking
  before_action :set_owner
  before_action :can_perform_action

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # @review_owner = Review.new(review_params_owner)
    # @review_user = Review.new(review_params_user)
    if @can_perform_action && @review.save
      redirect_to new_pet_booking_review_path(@review), notice: 'Review was successfully created.'
    elsif can_create
      render :new
    else
      render :home
    end
  end

  def edit
    #put the relevant fields in the view of edit (owner can only edit pet content and pet review, user can )
  end

  def update
    if @can_perform_action && @review.update(review_params)
      redirect_to pet_booking_review_path(@review), notice: 'Review was successfully edited.'
    elsif can_create
      render :new
    else
      render :edit
    end
  end

  def destroy
    if @can_perform_action
       @review.destroy
      redirect_to pet_booking_reviews_path(@review), notice: "You have deleted your review... be nice, tell us your thoughts"
    else
      redirect_to pet_booking_reviews_path(@review), notice: "Sorry, you cannot destroy what's not yours!"
    end
  end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def set_user
    set_booking
    @user = @booking.user
  end

  def set_owner
    set_booking
    @owner = @booking.pet.owner
  end

  def can_perform_action
    @can_perform_action = current_user == @owner || current_user == @user
  end


  # def review_params_owner
  #   params.require(:review).permit(:pet_rating, :pet_content)
  # end

  # def review_params_user
  #   params.require(:review).permit(:user_rating, :user_content)
  # end

  def review_params
    params.require(:review).permit(:pet_rating,:pet_content,:user_rating, :user_content)
  end

end

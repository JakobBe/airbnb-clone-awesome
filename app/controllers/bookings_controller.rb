class BookingsController < ApplicationController
  before_action :set_booking, only: [:approve, :decline, :destroy]

  def index
    @bookings = Booking.all
  end

  def create
    @review = Review.new
    @flat = Flat.find(params[:flat_id])
    @user = current_user
    @booking = Booking.new(bookings_params)
    @booking.user_id = @user.id

    @booking.status = "Pending"

    if @booking.save
      @booking.total_price = @booking.flat.price * @booking.nights
      @booking.save
      redirect_to bookings_path
    else render 'flats/show'
    end
  end


  def approve
    @booking.status = "Approved"
    @booking.save

    redirect_to bookings_path
  end

  def decline
    @booking.status = "Declined"
    @booking.save

    redirect_to bookings_path
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end


  private

  def bookings_params
    params.require(:booking).permit(:nights, :date, :flat_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end

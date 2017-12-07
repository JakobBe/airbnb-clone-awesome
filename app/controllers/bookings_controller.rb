class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def create
    @flat = Flat.find(params[:flat_id])
    @user = current_user
    @booking = Booking.new(bookings_params)
    @booking.user_id = @user.id
    @booking.total_price = @booking.flat.price * @booking.nights
    @booking.status = "Pending"
    if @booking.save
    redirect_to bookings_path
    else render :new
    end
  end

  private

  def bookings_params
    params.require(:booking).permit(:nights, :flat_id)
  end
end

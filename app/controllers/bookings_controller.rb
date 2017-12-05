class BookingsController < ApplicationController
  before_action :authenticate_user!

  # def index
  #   @bookings = Booking.all
  # end


  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(bookings_params)
    @flat = Flat.find(params[:flat_id])
    @user = User.find(params[:user_id])
    @booking.flat = @flat
    @booking.user = @user
    @booking.total_price = @flat.price * @booking.nights
    @booking.status = "Pending"
    @booking.save
  end

  def update

  end

  private

  def bookings_params
    params.require(:booking).permit(:nights)
  end

end

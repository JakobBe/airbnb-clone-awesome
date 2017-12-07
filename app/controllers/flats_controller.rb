class FlatsController < ApplicationController
  skip_before_action :authenticate_registration!, only: [:index, :show]
  def index
    @flats = Flat.all

    @flats_map = Flat.where.not(latitude: nil, longitude: nil)

    @markers = Gmaps4rails.build_markers(@flats_map) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def show
    @flat = Flat.find(params[:id])
    @booking = Booking.new
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @user = User.find_by(registration_id: current_registration.id)
    @flat.user = @user
    if @flat.save
      @user.homeowner = true
      @user.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    @flat.update(params[:flat])
  end


  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to myflats_path
  end

  def show_my_flats
    @flats = current_user.flats
  end


  private

  def flat_params
    params.require(:flat).permit(:location, :name, :price, :photo)
  end


end

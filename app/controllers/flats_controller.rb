class FlatsController < ApplicationController
  skip_before_action :authenticate_registration!, only: [:index, :show]
  def index
    @flats = Flat.all
    if params[:search]
      @flats = Flat.near(params[:search], 50).order("created_at DESC")
    else
      @flats = Flat.all.order("created_at DESC")
    end

    @flats_map = Flat.where.not(latitude: nil, longitude: nil)

    @markers = Gmaps4rails.build_markers(@flats_map) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end

    respond_to do |format|
      format.html {
        # redirect_to flats_path
      }
      format.js{

      }
    end
  end

  def show
    @flat = Flat.find(params[:id])
    @booking = Booking.new
    @reviews = @flat.reviews
    @review = Review.new
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
    params.require(:flat).permit(:location, :name, :price, :description, :photo, :search)
  end


end

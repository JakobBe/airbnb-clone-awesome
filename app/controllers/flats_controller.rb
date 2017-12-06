class FlatsController < ApplicationController
  skip_before_action :authenticate_registration!, only: [:index, :show]
  def index
    @flats = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
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
      redirect_to flat_path(@flat)
    else
      render :new
    end

  end

  private

  def flat_params
    params.require(:flat).permit(:location, :name, :price)
  end


end

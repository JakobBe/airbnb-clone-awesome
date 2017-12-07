class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def create
    @flat = Flat.find(params[:flat_id])
    @user = current_user
    @review = Review.new(reviews_params)
    @review.user_id = @user.id
    if @review.save
    redirect_to reviews_path
    else render :new
    end
  end

  def destroy
    @review.destroy
    redirect_to reviews_path
  end

  private

  def reviews_params
    params.require(:review).permit(:user_id, :title, :content)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end

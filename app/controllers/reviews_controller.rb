class ReviewsController < ApplicationController
  def index
    @rewiews = Rewiew.all
  end

  def show
    @rewiew = Rewiew.find(params[:id])
  end

  def new
    # We need @restaurant in our `simple_form_for`
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def edit
    @rewiew = Rewiew.find(params[:id])
  end

  def update
    @rewiew = Rewiew.find(params[:id])
    @rewiew.update(rewiew_params)
    redirect_to rewiew_path(@rewiew)
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    @review.save
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant), status: :see_other
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def rewiew_params
    params.require(:review).permit(:content, :rating)
  end

end

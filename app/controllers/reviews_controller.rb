class ReviewsController < ApplicationController
  # new_restaurant_review GET    /restaurants/:restaurant_id/reviews/new(.:format) reviews#new
  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  # restaurant_reviews POST   /restaurants/:restaurant_id/reviews(.:format)     reviews#create
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])

    @review = Review.new(review_params) # { content: '...' }
    @review.restaurant = @restaurant

    if @review.save # only returns true / false
      redirect_to restaurant_path(@restaurant)
    else
      # renders the /views/reviews/new.html.erb with a 422 error code
      render :new, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/:id
  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to restaurant_path(@review.restaurant)
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end

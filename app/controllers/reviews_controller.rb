class ReviewsController < ApplicationController



  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new
  end

  def create
    @review = Dose.create(review_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review.cocktail = @cocktail
    @review.save!
    redirect_to cocktail_path(@cocktail)
  end

private

  def review_params
    params.require(:dose).permit(:description, :cocktail_id, :rating )
  end

end

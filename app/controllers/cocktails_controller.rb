class CocktailsController < ApplicationController
  before_action :set_cocktail, only:[:show, :destroy]

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def index
    @cocktails = Cocktail.all
  end

  def show
    @doses = @cocktail.doses
    @reviews = @cocktail.reviews
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      flash[:notice] = "whuhu, that s a new cocktail!"
      redirect_to cocktail_path(@cocktail)
    else
     render 'new'
     flash[:alert] = "this cocktail already exists...."
   end
 end


 def destroy
  @cocktail.destroy
  redirect_to cocktails_path
end

private
def cocktail_params
  params.require(:cocktail).permit(:name, :ingredient_id, :dose_id, :photo, :photo_cache, :review_id)
end


end

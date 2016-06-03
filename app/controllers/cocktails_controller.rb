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
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save!
    redirect_to cocktail_path(@cocktail)
  end


  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

private
def cocktail_params
  params.require(:cocktail).permit(:name, :ingredient_id, :dose_id, :photo, :photo_cache)
end


end

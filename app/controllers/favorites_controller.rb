class FavoritesController < ApplicationController
  before_action :set_favorite, only: %i[ show edit update destroy ]

  def index
    @favorites = Favorite.all
    @products = Product.all
    create
  end

  
  def create
    @favorite = current_user.favorites.new(favorite_params)

    if @favorite.save
      redirect_to favorites_path
    else
      @product = @favorite.product
      render "favorites/index"
    end
  end

  def destroy
    @favorite.destroy

    respond_to do |format|
      format.html { redirect_to favorites_path, notice: "Produto was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private 
  def favorite_params
    params.permit(:product_id)
  end

  def set_favorite
    @favorite = Favorite.find(params[:id])
  end
end

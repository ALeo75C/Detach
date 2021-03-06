class FavoritesController < ApplicationController
  load_and_authorize_resource
  before_action :set_favorite, only: [:show, :edit, :update, :destroy]

  # GET /favorites
  # GET /favorites.json
  def index
    @favorites = Favorite.all
    @profiles = Profile.all
    @brands = Brand.all
    @products = Product.all
  end

  # GET /favorites/1
  # GET /favorites/1.json
  def show
  end

  # GET /favorites/new
  def new
    @favorite = Favorite.new
  end

  # GET /favorites/1/edit
  def edit
  end

  # POST /favorites
  # POST /favorites.json
  def create

    user = Profile.find(current_user.profile.id)
    user_favorites = user.favorites

    i = -1
    if user_favorites.count == 0
      @favorite = Favorite.new(profile_id: current_user.profile.id, product_id: params[:product_id])
    else
      user_favorites.each do |f|
        if params[:product_id].to_i == f.product_id
          i = f.id
        end
      end
    end

    if i == -1
      product = Product.find(params[:product_id])
      @favorite = Favorite.new(profile_id: current_user.profile.id, product_id: params[:product_id])

      respond_to do |format|
        if @favorite.save
          # format.html { redirect_to brand_product_path(product.brand.id, params[:product_id]) }
          format.json { render :show, status: :created, location: @favorite }
          format.js
        else
          # format.html { render :new }
          format.json { render json: @favorite.errors, status: :unprocessable_entity }
        end
      end
    else
      Favorite.find(i).destroy
    end

  end

  # PATCH/PUT /favorites/1
  # PATCH/PUT /favorites/1.json
  def update
    respond_to do |format|
      if @favorite.update(favorite_params)
        format.html { redirect_to @favorite }
        format.json { render :show, status: :ok, location: @favorite }
      else
        format.html { render :edit }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorites/1
  # DELETE /favorites/1.json
  def destroy
    @favorite.destroy
    respond_to do |format|
      format.html { redirect_to profile_favorites_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def favorite_params
      params[:favorite] = Hash.new
      params[:favorite][:profile_id] = params[:profile_id]
      params[:favorite][:product_id] = params[:product_id]
      params.require(:favorite).permit(:profile_id, :product_id)
    end
end

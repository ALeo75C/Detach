class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create

    puts "+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+"
    puts params[:effects]

    @product = Product.new(product_params)


    respond_to do |format|
      if @product.save
        params[:components].each do |component|
          component.last.each do |id|
            s = Structure.create!(component_id: id, product_id: @product.id)
          end
        end

        params[:effects].each do |effect|
          effect.last.each do |id|
            s = ProductPromise.create!(active_effect_id: id, product_id: @product.id)
          end
        end

        format.html { redirect_to brand_path(id: @product.brand_id), notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to brand_product_path(@product.brand_id), notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to brand_path(id: @product.brand_id), notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:brand_id, :name, :description, :image)
    end
end

class ActiveEffectsController < ApplicationController
  before_action :set_active_effect, only: [:show, :edit, :update, :destroy]

  # GET /active_effects
  # GET /active_effects.json
  def index
    @active_effects = ActiveEffect.all
  end

  # GET /active_effects/1
  # GET /active_effects/1.json
  def show
  end

  # GET /active_effects/new
  def new
    @active_effect = ActiveEffect.new
  end

  # GET /active_effects/1/edit
  def edit
  end

  # POST /active_effects
  # POST /active_effects.json
  def create
    @active_effect = ActiveEffect.new(active_effect_params)

    respond_to do |format|
      if @active_effect.save
        format.html { redirect_to @active_effect, notice: 'Active effect was successfully created.' }
        format.json { render :show, status: :created, location: @active_effect }
      else
        format.html { render :new }
        format.json { render json: @active_effect.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /active_effects/1
  # PATCH/PUT /active_effects/1.json
  def update
    respond_to do |format|
      if @active_effect.update(active_effect_params)
        format.html { redirect_to @active_effect, notice: 'Active effect was successfully updated.' }
        format.json { render :show, status: :ok, location: @active_effect }
      else
        format.html { render :edit }
        format.json { render json: @active_effect.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /active_effects/1
  # DELETE /active_effects/1.json
  def destroy
    @active_effect.destroy
    respond_to do |format|
      format.html { redirect_to active_effects_url, notice: 'Active effect was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_active_effect
      @active_effect = ActiveEffect.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def active_effect_params
      params.require(:active_effect).permit(:name)
    end
end

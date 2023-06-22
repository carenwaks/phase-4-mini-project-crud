class SpicesController < ApplicationController
    # GET /spices
  def index
    spice = Spice.all
    render json: spice
  end

  # POST /spice
  def create
    spice = Spice.create(spice_params)
    render json: spice, status: :created
  end

  # PATCH /spice/:id
  def update
    spice = find_spice
    spice.update(spice_params)
    render json: spice
  end

  # DELETE /spice/:id
  def destroy
    spice = find_spice
    spice.destroy
    head :no_content
  end

  private

  def find_spice
    Spice.find(params[:id])
  end

  def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
  end

  def render_not_found_response
    render json: { error: "Spice not found" }, status: :not_found
  end
end

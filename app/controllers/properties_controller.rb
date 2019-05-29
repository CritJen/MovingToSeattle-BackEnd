class PropertiesController < ApplicationController
    before_action :set_Property, only: [:show, :update, :destroy]

  # GET /Propertys
  def index
    @Propertys = Property.all

    render json: @Propertys
  end

  # GET /Propertys/1
  def show
    render json: @Property
  end

  # POST /Propertys
  def create
    @Property = Property.new(Property_params)
    byebug
    if @Property.save
      render json: @Property, status: :created, Property: @Property
    else
      render json: @Property.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /Propertys/1
  def update
    if @Property.update(Property_params)
      render json: @Property
    else
      render json: @Property.errors, status: :unprocessable_entity
    end
  end

  # DELETE /Propertys/1
  def destroy
    @Property.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_Property
      @Property = Property.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def Property_params
      params.require(:Property).permit(:name, :latitude, :longitude, :tags, :category_id)
    end
end

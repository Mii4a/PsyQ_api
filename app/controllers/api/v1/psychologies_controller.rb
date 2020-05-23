class Api::V1::PsychologiesController < ApplicationController
  before_action :set_psychology, only: [:show, :update, :destroy]

  # GET /psychologies
  # GET /psychologies.json
  def index
    @psychologies = Psychology.all
    render json: @psychologies, status: :ok
  end

  # GET /psychologies/1
  # GET /psychologies/1.json
  def show
    @psychology = Psychology.find(params[:id])
    @workbooks = @psychology.workbooks.all

    render json: { workbooks: @workbooks, psychology: @psychology}
  end

  # POST /psychologies
  # POST /psychologies.json
  def create
    @psychology = Psychology.new(psychology_params)

    if @psychology.save
      render :show, status: :created, location: @psychology
    else
      render json: @psychology.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /psychologies/1
  # PATCH/PUT /psychologies/1.json
  def update
    if @psychology.update(psychology_params)
      render :show, status: :ok, location: @psychology
    else
      render json: @psychology.errors, status: :unprocessable_entity
    end
  end

  # DELETE /psychologies/1
  # DELETE /psychologies/1.json
  def destroy
    @psychology.destroy
  end

  def basic_psychologies
    @basic_psychologies = Psychology.where(category: 'basic')
    render json: @basic_psychologies, status: :ok
  end

  def applied_psychologies
    @applied_psychologies = Psychology.where(category: 'applied')
    render json: @applied_psychologies, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_psychology
      @psychology = Psychology.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def psychology_params
      params.require(:psychology).permit(:category, :explanation, :field, :japanese_field_name)
    end
end

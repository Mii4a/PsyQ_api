class Api::V1::PreferenceRelationshipsController < ApplicationController
  before_action :set_preference_relationship, only: [:destroy]

  # POST /preference_relationships
  # POST /preference_relationships.json
  def create
    @preference_relationship = PreferenceRelationship.new(preference_relationship_params)

    if @preference_relationship.save
      render status: :created, location: @preference_relationship
    else
      render json: @preference_relationship.errors, status: :unprocessable_entity
    end
  end

  # DELETE /preference_relationships/1
  # DELETE /preference_relationships/1.json
  def destroy
    @preference_relationship.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_preference_relationship
      @preference_relationship = PreferenceRelationship.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def preference_relationship_params
      params.require(:preference_relationship).permit(:user_id, :workbook_id)
    end
end

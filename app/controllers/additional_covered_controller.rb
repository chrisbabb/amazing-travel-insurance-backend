class AdditionalCoveredController < ApplicationController
    
    def index
        render json: AdditionalCovered.all
    end

    def create
        additional_covered = AdditionalCovered.create!(legal_params)
        render json: additional_covered, status: :created
    end

    private

    def legal_params
        params.permit(:first_name, :last_name, :dob, :policy_id)
    end

end
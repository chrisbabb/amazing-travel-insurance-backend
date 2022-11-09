class PolicyController < ApplicationController
    
    def index
        render json: Policy.all
    end

    def create
        policy = Policy.create!(legal_params)
        render json: policy, status: :created
    end

    private

    def legal_params
        params.permit(:policy_number, :purchase_date, :start_date, :end_date, :customer_id )
    end

end
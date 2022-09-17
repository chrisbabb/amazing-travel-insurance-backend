class CreditCardController < ApplicationController
    
    def create
        credit_card = CreditCard.create!(legal_params)
        render json: credit_card, status: :created
    end

    private

    def legal_params
        params.permit(:name, :number, :last_four, :exp_month, :exp_year, :cvv, :customer_id)
    end

end
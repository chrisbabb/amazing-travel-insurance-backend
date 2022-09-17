class CustomerController < ApplicationController
    
    def index
        render json: Customer.all
    end

    def show
        render json: Customer.find(params[:id])
    end

    def create
        customer = Customer.create!(legal_params)
        if customer.save
            token = issue_token(customer)
            render json: customer, status: :created
        else
            render json: { valid: "false", errorMessages: user.errors.messages }
        end

    end

    private

    def legal_params
        params.permit(:first_name, :last_name, :email, :user_level, :password, :address, :city, :state, :postal_code, :phone, :dob)
    end

end
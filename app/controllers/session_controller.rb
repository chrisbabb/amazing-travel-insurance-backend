class SessionController < ApplicationController

    def create
        customer = Customer.find_by(email: params[:email])
        if customer&.authenticate(params[:password])
            token = issue_token(customer)
            render json: { valid: "true", user: {id: customer.id, username: customer.email, first_name: customer.first_name, user_level: customer.user_level}, token: token}
        else
            render json: { valid: "false", errorMessages: {login: "username or password is wrong"} }
        end
    end

    def show
        if logged_in?
            render json: { valid: "true", user: {id: current_user.id, username: current_user.email, first_name: current_user.first_name} }
        else
            render json: { valid: "false", errorMessages: {session: "Please login to continue"}}
        end
    end

end
class ProductController < ApplicationController
    
    def index
        render json: Product.all
    end

    def create
        product = Product.create!(legal_params)
        render json: product, status: :created
    end

    private

    def legal_params
        params.permit(:name, :coverage_level, :price, :fee, :price_total, :policy_id)
    end

end
class RaterController < ApplicationController

    def create
        start_date = Date.strptime(params[:start_date], "%m/%d/%Y")
        end_date = Date.strptime(params[:end_date], "%m/%d/%Y")
        date_difference = end_date.mjd - start_date.mjd
        final_price = 0

        case params[:product_name]
        when "tripcan"
            final_price = (params[:trip_cost] * 0.1 + 30).round
        when "annualmedevac"
            if params[:age].any?{|x| x >= 75 }
                case params[:age].length
                when 1
                    final_price = 350
                when 2
                    final_price = 500
                when 3 .. 5
                    final_price = 750
                end
            else
                case params[:age].length
                when 1
                    final_price = 250
                when 2
                    final_price = 400
                when 3 .. 5
                    final_price = 650
                end
            end
        when "dailymedevac"
            over_seven_four = params[:ages].count { |n| n >= 75 }
            final_price = date_difference * over_seven_four * 5
            final_price += date_difference * (params[:ages].length - over_seven_four) * 3
            final_price += 10
        end
        
        render json: final_price
    end

    private

    def legal_params
        params.permit(:name, :ages, :product_name, :trip_cost, :start_date, :end_date)
    end

end
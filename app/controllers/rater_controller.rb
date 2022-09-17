class RaterController < ApplicationController

    def create
        start_date = Date.strptime(params[:start_date], "%m/%d/%Y")
        end_date = Date.strptime(params[:end_date], "%m/%d/%Y")
        date_difference = end_date.mjd - start_date.mjd
        final_price = 0

        case params[:product_name]
        when "tripcan"
            final_price = ((params[:trip_cost] * (params[:coverage_level] * 0.1)) + 30).round
        when "annualmedevac"
            if params[:ages].any?{|x| x >= 75 }
                case params[:ages].length
                when 1
                    final_price = 350
                when 2
                    final_price = 500
                end
            else
                case params[:ages].length
                when 1
                    final_price = 250
                when 2
                    final_price = 400
                when 3 .. 7
                    final_price = 650
                end
            end
        when "dailymedevac"
            over_seven_four = params[:ages].count { |n| n >= 75 }
            final_price = date_difference * over_seven_four * 5
            final_price += date_difference * (params[:ages].length - over_seven_four) * 3
        end

        if params[:product_name] === 'dailymedevac'
            plan_fee = 10
            total_price = final_price + plan_fee
            return_data = {'product' => params[:product_name], 'travelers' => params[:ages].length, 'price' => final_price, 'plan_fee' => plan_fee, 'total_price' => total_price, 'days' => date_difference, 'start_date' => start_date, 'end_date' => end_date }.to_json
        elsif params[:product_name] === 'annualmedevac'
            plan_fee = 30
            total_price = final_price + plan_fee
            return_data = {'product' => params[:product_name], 'travelers' => params[:ages].length, 'price' => final_price, 'plan_fee' => plan_fee, 'total_price' => total_price, 'start_date' => start_date, 'end_date' => end_date }.to_json
        else
            plan_fee = 10
            total_price = final_price + plan_fee
            return_data = {'product' => params[:product_name], 'coverage_level' => params[:coverage_level],'price' => final_price, 'plan_fee' => plan_fee, 'total_price' => total_price, 'start_date' => start_date, 'end_date' => end_date }.to_json
        end

        
        render json: return_data
    end

    private

    def legal_params
        params.permit(:ages, :product_name, :coverage_level, :trip_cost, :start_date, :end_date)
    end

end
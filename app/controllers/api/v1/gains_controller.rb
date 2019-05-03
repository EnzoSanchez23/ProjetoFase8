class Api::V1::GainsController < BaseController
    before_action :authenticate_with_token!

    def index
        gains = current_user.gains
        render json: {gains: gains}, status: 200
    end

    def show
        gain = current_user.gains.find(params[:id])
        render json: gain, status: 200
    end

    def create
        gain = current_user.gains.build(gains_params)
        if gains.save
            render json: gain, status: 201
        else
            render json: {errors: gains.errors}, status: 422
        end
    end

    def destroy
        gain = current_user.gains.find(params[:id])
        gains.destroy
        head 204
    end

    def update
        gains = current_user.gains.find(params[:id])
        if gain.update_attributes(gains_params)
            render json: gain, status: 200
        else
            render json: {errors: gains.errors}, status: 422
        end
    end

    private

    def gains_params
        params.require(:gain).permit(:description, :value, :date)
    end
end

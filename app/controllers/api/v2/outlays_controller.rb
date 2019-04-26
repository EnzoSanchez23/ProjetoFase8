class Api::V2::OutlaysController < ApplicationController
    before_action :authenticate_with_token!

    def index
        outlays = current_user.outlays.ransack(params[:q]).result
        render json: {gains:gains}, status: 200
    end

    def show
        outlay = current_user.outlays.find(params[:id])
        render json: outlay, status: 200
    end

    def create
        outlay = current_user.outlays.build(outlays_params)
        if outlays.save
            render json: outlay, status: 201
        else
            render json: {errors: outlays.errors}, status: 422
        end
    end

    def destroy
        outlay = current_user.outlays.find(params[:id])
        outlays.destroy
        head 204
    end
    
    def update
        outlay = current_user.outlays.find(params[:id])
        if outlay.update_attributes(outlays_params)
            render json: outlay, status: 200
        else
            render json: {errors: outlays.errors}, status: 422
        end
    end

    private

    def outlays_params
        params.require(:outlay).permit(:description, :value, :date)
    end
end

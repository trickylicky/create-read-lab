class PlantsController < ApplicationController

    def index
       plant = Plant.all
       render json: plant 
    end

    def show
        plant = Plant.find_by(id: params[:id])
        if plant
            render json: plant
        else
            puts "an error found"
        end
    end

    def create
        plant = Plant.create(plant_param)
        render json: plant , status: :created
    end

    private

    def plant_param
        params.permit(:name, :image, :price)
    end

end

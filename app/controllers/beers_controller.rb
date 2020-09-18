class BeersController < ApplicationController

    def index
        @beers = Beer.all
    end

    def show
        @beer = Beer.find(params[:id])
    end

    def new
        @beer = Beer.new
    end

    def create
        ibu = beer_params(:ibu)[:ibu] + " IBU"
        alcohol = beer_params(:alcohol)[:alcohol] + "%"
        @beer = Beer.create(beer_params(:name, :style))
        @beer.update(ibu: ibu, alcohol: alcohol)
        redirect_to beer_path(@beer)
    end

    def edit
        @beer = Beer.find(params[:id])
    end

    def update
        @beer = Beer.find(params[:id])
        @beer.update(beer_params(:name))
        redirect_to beer_path(@beer)
    end

    def destroy
        Beer.destroy(params[:id])
        redirect_to beers_path
    end


    private

    def beer_params(*args)
        params.require(:beer).permit(*args)
    end

end

class BeersController < ApplicationController

  def index
    exclude = ["id", "created_at", "updated_at", "api_id", "description"]
    Beer.table(exclude)
  end

  def new
    @beer = Beer.new
  end

  def create
    @beer = Beer.create(params[:beer])

      if @beer.save
        redirect_to edit_beer_path(@beer)
      end
  end

  def edit
    @beer = Beer.find(params[:id])
    @regional_styles = RegionalStyle.all
  end

end
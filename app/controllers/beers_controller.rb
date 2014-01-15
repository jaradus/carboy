class BeersController < ApplicationController

  def index
    # Requests items from the database
    @items = Beer.all
    # Column Names, excluding those in 'exclude'
    exclude = ["id", "created_at", "updated_at", "api_id", "description"]
    @items_header = Beer.column_names - exclude
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

  def show
    @item = Beer.find(params[:id])
  end

end
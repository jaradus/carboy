class BeersController < ApplicationController

  def index
    # Requests beers from the database
    @items = Beer.all
    raw_header = Beer.column_names()
    # Gets fermentable table headers, and removes database-specific information
      @items_header = []
      exclude_list = ["id", "created_at", "updated_at", "api_id", "description"]
      raw_header.each do |header|
        unless exclude_list.include? header
          @items_header << header
        end
      end
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
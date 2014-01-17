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
    @regional_styles = Regionalstyle.all
  end

  def show
    @item = Beer.find(params[:id])
  end

  def update
    @beer = Beer.find(params[:id])
      @beer.update_attributes(params[:beer])

    if @regional_style = @beer.beerstyle
      @regional_style.update_attributes(beer_id: params[:id], regionalstyle_id: params["beer"]["regional_style_id"])
    else
      Beerstyle.create(beer_id: params[:id], regionalstyle_id: params["beer"]["regional_style_id"])
    end

    if @beer.update_attributes(params[:beer])
      redirect_to @beer, notice: 'Beer was successfully updated.' 
    else
      render "edit"
    end
  end

  def destroy
    @beer = Beer.find(params[:id])
    @beer.destroy

    redirect_to beers_path
  end

end
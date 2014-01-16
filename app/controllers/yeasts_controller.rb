class YeastsController < ApplicationController

  def index
    # Requests yeasts from the database
    @items = Yeast.all
    raw_header = Yeast.column_names()
    # Gets yeast table headers, and removes database-specific information
      @items_header = []
      exclude_list = ["id", "created_at", "updated_at", "api_id", "description", "attenuation_min", "attenuation_max", "ferment_temp_min", "ferment_temp_max", "alcohol_tolerance_min", "alcohol_tolerance_max", "product_id"]
      raw_header.each do |header|
        unless exclude_list.include? header
          @items_header << header
        end
      end
  end

  def new
    @yeast = Yeast.new
  end

  def create
    @yeast = Yeast.create(params[:yeast])

      if @yeast.save
        redirect_to edit_yeast_path(@yeast)
      end
  end

  def edit
    @yeast = Yeast.find(params[:id])
  end

  def update
    @yeast = Yeast.find(params[:id])
      @yeast.update_attributes(params[:yeast])

    if @yeast.update_attributes(params[:yeast])
      redirect_to @yeast, notice: 'Yeast was successfully updated.' 
    else
      render "edit"
    end
  end

  def show
    @item = Yeast.find(params[:id])
  end

  def destroy
    yeast_id = params[:id]
    yeast = Yeast.find(yeast_id)
    yeast.destroy
    redirect_to yeasts_path
  end

end
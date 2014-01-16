class HopsController < ApplicationController

  def index
    # Requests beers from the database
    @items = Hop.all
    raw_header = Hop.column_names()
    # Gets hop table headers, and removes database-specific information
      @items_header = []
      exclude_list = ["id", "created_at", "updated_at", "api_id", "description", "humulene_min", "humulene_max", "caryophyllene_min", "caryophyllene_max", "cohumulone_min", "cohumulone_max", "myrcene_min", "myrcene_max", "farnesene_min", "farnesene_max", "is_noble", "for_bittering", "for_flavor", "for_aroma"]
      raw_header.each do |header|
        unless exclude_list.include? header
          @items_header << header
        end
      end
  end

  def new
    @hop = Hop.new
  end

  def create
    @hop = Hop.create(params[:hop])

      if @hop.save
        redirect_to edit_hop_path(@hop)
      end
  end

  def edit
    @hop = Hop.find(params[:id])
  end

  def update
    @hop = Hop.find(params[:id])
      @hop.update_attributes(params[:hop])

    if @hop.update_attributes(params[:hop])
      redirect_to @hop, notice: 'Hop was successfully updated.' 
    else
      render "edit"
    end
  end

  def show
    @item = Hop.find(params[:id])
  end

  def destroy
    hop_id = params[:id]
    hop = Hop.find(hop_id)
    hop.destroy
    redirect_to hops_path
  end

end
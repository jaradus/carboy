class FermentablesController < ApplicationController

  def index
    # Requests items from the database
    @items = Fermentable.all
    # Column Names, excluding those in 'exclude'
    exclude = ["id", "created_at", "updated_at", "api_id", "description", "srm_id", "srm_precise", "moisture_content", "diastatic_power", "potential_yield", "dry_yield", "protein", "soluble_nitrogen_ratio", "max_in_batch", "requires_mashing"]
    @items_header = Fermentable.column_names - exclude
  end

  def new
    @fermentable = Fermentable.new
  end

  def create
    @fermentable = Fermentable.create(params[:fermentable])

      if @fermentable.save
        redirect_to edit_fermentable_path(@fermentable)
      end
  end

  def edit
    @fermentable = Fermentable.find(params[:id])
  end

  def update
    @fermentable = Fermentable.find(params[:id])
      @fermentable.update_attributes(params[:fermentable])

    if @fermentable.update_attributes(params[:fermentable])
      redirect_to @fermentable, notice: 'Fermentable was successfully updated.' 
    else
      render "edit"
    end
  end

  def show
    @item = Fermentable.find(params[:id])
    # This may cause a stack overflow
    # session[:fermentable] = @item
  end

  def destroy
    fermentable_id = params[:id]
    fermentable = Fermentable.find(fermentable_id)
    fermentable.destroy
    redirect_to fermentables_path
  end

end
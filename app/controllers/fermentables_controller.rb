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
    @desc = ["The unique id of the fermentable.","Corresponding API id","The name of the fermentable.","The description of the fermentable.","ISO country name.","","","The average moisture content of the grain, expressed as a percent of weight.","A measure of how much starch converting enzyme is in the grain. A higher number (common in pale malts) indicates the presence of more enzymes for starch conversion. Expressed as a percentage.","Equivalent to the potential field, but expressed as a percentage of total weight converted.","The potential yield of the ingredient, expressed in specific gravity units.","The percentage of the fermentable that is protein.","The ratio of soluble nitrogen to total nitrogen. Expressed as a percentage. The soluble nitrogen ratio is an important indicator of malt modification. The higher the number, the more highly modified the malt.","The maximum recommended percentage of the mash makeup that this fermentable can be.","Whether or not the fermentable should be mashed.","","The list of characteristics / qualities of the fermentable","The ID of the corresponding SRM object. See the srm field for more information like hex color.","The precise SRM value of the fermentable. Whereas the srmId is intended for things like providing the color, the srmPrecise value is ideal for things like calculations in recipes. Expressed as a percentage."]
  end

  def destroy
    fermentable_id = params[:id]
    fermentable = Fermentable.find(fermentable_id)
    fermentable.destroy
    redirect_to fermentables_path
  end

end
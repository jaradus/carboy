class SpecialtiesController < ApplicationController

  def index
    # Requests specialties from the database
    @items = Specialty.all
    raw_header = Specialty.column_names()
    # Gets specialty table headers, and removes database-specific information
      @items_header = []
      exclude_list = ["id", "created_at", "updated_at", "description"]
      raw_header.each do |header|
        unless exclude_list.include? header
          @items_header << header
        end
      end
  end

  def new
    @specialty = Specialty.new
  end

  def create
    @specialty = Specialty.create(params[:specialty])

      if @specialty.save
        redirect_to edit_specialty_path(@specialty)
      end
  end

  def edit
    @specialty = Specialty.find(params[:id])
  end

  def update
    @specialty = Specialty.find(params[:id])
      @specialty.update_attributes(params[:specialty])

    if @specialty.update_attributes(params[:specialty])
      redirect_to @specialty, notice: 'Specialty was successfully updated.' 
    else
      render "edit"
    end
  end

  def show
    @item = Specialty.find(params[:id])
  end

  def destroy
    specialty_id = params[:id]
    specialty = Specialty.find(specialty_id)
    specialty.destroy
    redirect_to specialties_path
  end

end
class BatchesController < ApplicationController

  def index
    # Requests batchs from the database
    @items = Batch.all
    raw_header = Batch.column_names()
    # Gets batch table headers, and removes database-specific information
      @items_header = []
      exclude_list = ["id", "created_at", "notes", "updated_at", "description", "label_url", "original_gravity", "final_gravity", "fermentables_attributes", "hops_attributes", "yeasts_attributes", "specialties_attributes", "user_id"]
      raw_header.each do |header|
        unless exclude_list.include? header
          @items_header << header
        end
      end
      # params[:beer] = nil
  end

  def new
    @batch = Batch.new
  end

  def create
    @batch = Batch.create(params[:batch])

      if @batch.save
        redirect_to edit_batch_path(@batch)
      end
  end

  def edit
    @batch = Batch.find(params[:id])

    Hop.all.length.times do
      hop = @batch.hops.build
    end

  end

  def update
    # params["batch"].keys.each do |key|
    params["batch"].each do |batch|
      case
      when batch[0].start_with?("hop")
          if batch[1]["used"] == "1"
            hop_id =           batch[1]["hop_id"]
            batch_id =         params[:id]   
            hop_id =           batch[1][:hop_id]
            quantity =         batch[1][:quantity]
            unit_measure =     batch[1][:unit_measure]
            minutes_in_boil =  batch[1][:minutes_in_boil]
            alpha_acid =       batch[1][:alpha_acid]
            beta_acid =        batch[1][:beta_acid]
            BatchesHop.create(batch_id: batch_id, hop_id: hop_id, quantity: quantity, unit_measure: unit_measure, minutes_in_boil: minutes_in_boil, alpha_acid: alpha_acid, beta_acid: beta_acid)
          end
      when batch[0].start_with?("fermentable")
          if batch[1]["used"] == "1"
            fermentable_id  =   batch[1][:fermentable_id]
            batch_id        =   params[:id]   
            quantity        =   batch[1][:quantity]
            unit_measure    =   batch[1][:unit_measure]
            minutes_in_boil =   batch[1][:minutes_in_boil]
            BatchesFermentable.create(batch_id: batch_id, fermentable_id: fermentable_id, quantity: quantity, unit_measure: unit_measure, minutes_in_boil: minutes_in_boil)
          end
      when batch[0].start_with?("yeast")
          if batch[1]["used"] == "1"
            yeast_id        =   batch[1][:yeast_id]
            batch_id        =   params[:id]   
            quantity        =   batch[1][:quantity]
            unit_measure    =   batch[1][:unit_measure]
            starter =   batch[1][:starter]
            BatchesYeast.create(batch_id: batch_id, yeast_id: yeast_id, quantity: quantity, unit_measure: unit_measure, starter: starter)
          end
      when batch[0].start_with?("specialty")
          if batch[1]["used"] == "1"
            specialty_id         =   batch[1][:specialty_id]
            batch_id             =   params[:id]   
            quantity             =   batch[1][:quantity]
            unit_measure         =   batch[1][:unit_measure]
            minutes_in_kettle    =   batch[1][:minutes_in_kettle]
            purpose              =   batch[1][:purpose]
            BatchesSpecialty.create(batch_id: batch_id, specialty_id: specialty_id, quantity: quantity, unit_measure: unit_measure, minutes_in_kettle: minutes_in_kettle, purpose: purpose)
          end
      end
    end

    # params = { batch: {
    #     batch_id:         params[:batch_id],
    #     hop_id:           params[:hop_id],
    #     quantity:         params[:quantity],
    #     unit_measure:     params[:unit_measure],
    #     minutes_in_boil:  params[:minutes_in_boil],
    #     alpha_acid:       params[:alpha_acid],
    #     beta_acid:        params[:beta_acid],
    #     hops_attributes: [
    #                     { hop_id:           hop_id },
    #                     { quantity:         quantity },
    #                     { unit_measure:     unit_measure },
    #                     { minutes_in_boil:  minutes_in_boil },
    #                     { alpha_acid:       alpha_acid },
    #                     { beta_acid:        beta_acid },
    #                      ]
    #   }}

    # if @batch.update_attributes(@element)
    #   redirect_to @batch, notice: 'Batch was successfully updated.' 
    # else
    #   render "edit"
    # end
    redirect_to batch_path(params[:id])
  end

  def show
    @item = Batch.find(params[:id])
  end

  def destroy
    batch_id = params[:id]
    batch = Batch.find(batch_id)
    batch.destroy
    redirect_to batches_path
  end

end
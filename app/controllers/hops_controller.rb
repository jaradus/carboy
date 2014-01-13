class HopsController < ApplicationController

  def index
    # Requests hops from the database
    @hops = Hop.all
    raw_hop_header = Hop.column_names()
    # Gets hop table headers, and removes database-specific information
      @hops_header = []
      exclude_list = ["id", "created_at", "updated_at"]
      raw_hop_header.each do |header|
        unless exclude_list.include? header
          @hops_header << header
        end
      end
  end

end
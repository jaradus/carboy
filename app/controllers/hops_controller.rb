class HopsController < ApplicationController

  def index
    # Requests beers from the database
    @items = Hop.all
    raw_header = Hop.column_names()
    # Gets fermentable table headers, and removes database-specific information
      @items_header = []
      exclude_list = ["id", "created_at", "updated_at", "api_id", "description"]
      raw_header.each do |header|
        unless exclude_list.include? header
          @items_header << header
        end
      end
  end

end
class Yeast < ActiveRecord::Base

  attr_accessible :name, :api_id, :description, :yeast_type, :attenuation_min, :attenuation_max, :ferment_temp_min, :ferment_temp_max, :alcohol_tolerance_min, :alcohol_tolerance_max, :supplier, :product_id, :yeast_format, :category

  def index

  end

  def self.update_database
    yeasts_pages = HTTParty.get("http://api.brewerydb.com/v2/yeasts/?key=#{ENV['BREWERYAPI_KEY']}&p=all")["numberOfPages"]

    (1..yeasts_pages).each do |page|
      yeasts = HTTParty.get("http://api.brewerydb.com/v2/yeasts/?key=#{ENV['BREWERYAPI_KEY']}&p=#{page}")["data"]
      
      yeasts.each do |y|
        @yeast = {}
        unless Yeast.find_by_name(y['name'])
          # Example: @yeast[:name] = f["name"]
          @yeast[:name] = y["name"]
          @yeast[:api_id] = y["id"]
          @yeast[:description] = y["description"]
          @yeast[:yeast_type] = y["yeastType"]
          @yeast[:attenuation_min] = y["attenuationMin"]
          @yeast[:attenuation_max] = y["attenuationMax"]
          @yeast[:ferment_temp_min] = y["fermentTempMin"]
          @yeast[:ferment_temp_max] = y["fermentTempMax"]
          @yeast[:alcohol_tolerance_min] = y["alcoholToleranceMin"]
          @yeast[:alcohol_tolerance_max] = y["alcoholToleranceMax"]
          @yeast[:supplier] = y["supplier"]
          @yeast[:product_id] = y["productID"]
          @yeast[:yeast_format] = y["yeastFormat"]
          @yeast[:category] = y["category"]
          Yeast.create(@yeast)
        end
      end
    end
  end

end
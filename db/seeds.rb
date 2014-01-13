# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

fermentables_pages = HTTParty.get("http://api.brewerydb.com/v2/fermentables/?key=#{ENV['BREWERYAPI_KEY']}&p=all")["numberOfPages"]

(1..fermentables_pages).each do |page|
  fermentables = HTTParty.get("http://api.brewerydb.com/v2/fermentables/?key=#{ENV['BREWERYAPI_KEY']}&p=#{page}")["data"]
  
  fermentables.each do |f|
    @fermentable = {}
    unless Fermentable.find_by_name("f['name']")
      @fermentable[:api_id] = f["id"]
      @fermentable[:name] = f["name"]
      @fermentable[:description] = f["description"]
      @fermentable[:country_iso_code] = f["countryOfOrigin"]
      @fermentable[:srm_id] = f["srmId"]
      @fermentable[:srm_precise] = f["srmPrecise"]
      @fermentable[:moisture_content] = f["moistureContent"]
      @fermentable[:diastatic_power] = f["diastatisPower"]
      @fermentable[:potential_yield] = f["potential"]
      @fermentable[:dry_yield] = f["dryYield"]
      @fermentable[:protein] = f["protein"]
      @fermentable[:soluble_nitrogen_ratio] = f["solubleNitrogenRatio"]
      @fermentable[:max_in_batch] = f["maxInBatch"]
      @fermentable[:requires_mashing] = f["requiresMashing"]
      @fermentable[:category] = f["category"]
        # Characteristics are returned as an array of hashes. This goes through the array and gets just the name, and passes that to @fermentable
      unless f["characteristics"] == nil
        @character = []
        f["characteristics"].each do |c| 
            @character << c["name"]
        end
      @fermentable[:characteristics] = @character.join(", ")
      end
      Fermentable.create(@fermentable)
    end
  end
end




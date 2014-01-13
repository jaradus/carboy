# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Seeds Fermentables
# ====================================================================
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

# Seeds Hops
# ====================================================================
hops_pages = HTTParty.get("http://api.brewerydb.com/v2/hops/?key=#{ENV['BREWERYAPI_KEY']}&p=all")["numberOfPages"]

(1..hops_pages).each do |page|
  hops = HTTParty.get("http://api.brewerydb.com/v2/hops/?key=#{ENV['BREWERYAPI_KEY']}&p=#{page}")["data"]
  
  hops.each do |f|
    @hop = {}
    unless Hop.find_by_name("f['name']")
      @hop[:name] = f["name"]
      @hop[:api_id] = f["id"]
      @hop[:description] = f["description"]
      @hop[:country_iso_code] = f["countryOfOrigin"]
      @hop[:alpha_acid_min] = f["alphaAcidMin"]
      @hop[:alpha_acid_max] = f["alphaAcidMax"]
      @hop[:beta_acid_min] = f["betaAcidMin"]
      @hop[:beta_acid_max] = f["betaAcidMax"]
      @hop[:humulene_min] = f["humuleneMin"]
      @hop[:humulene_max] = f["humuleneMax"]
      @hop[:caryophyllene_min] = f["caryophylleneMin"]
      @hop[:caryophyllene_max] = f["caryophylleneMax"]
      @hop[:cohumulone_min] = f["cohumuloneMin"]
      @hop[:cohumulone_max] = f["cohumuloneMax"]
      @hop[:myrcene_min] = f["myrceneMin"]
      @hop[:myrcene_max] = f["myrceneMax"]
      @hop[:farnesene_min] = f["farneseneMin"]
      @hop[:farnesene_max] = f["farneseneMax"]
      @hop[:is_noble] = f["isNoble"]
      @hop[:for_bittering] = f["forBittering"]
      @hop[:for_flavor] = f["forFlavor"]
      @hop[:for_aroma] = f["forAroma"]
      Hop.create(@hop)
    end
  end
end
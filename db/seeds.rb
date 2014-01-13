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
    unless Fermentable.find_by_name(f['name'])
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
  
  hops.each do |h|
    @hop = {}
    unless Hop.find_by_name(h['name'])
      @hop[:name] = h["name"]
      @hop[:api_id] = h["id"]
      @hop[:description] = h["description"]
      @hop[:country_iso_code] = h["countryOfOrigin"]
      @hop[:alpha_acid_min] = h["alphaAcidMin"]
      @hop[:alpha_acid_max] = h["alphaAcidMax"]
      @hop[:beta_acid_min] = h["betaAcidMin"]
      @hop[:beta_acid_max] = h["betaAcidMax"]
      @hop[:humulene_min] = h["humuleneMin"]
      @hop[:humulene_max] = h["humuleneMax"]
      @hop[:caryophyllene_min] = h["caryophylleneMin"]
      @hop[:caryophyllene_max] = h["caryophylleneMax"]
      @hop[:cohumulone_min] = h["cohumuloneMin"]
      @hop[:cohumulone_max] = h["cohumuloneMax"]
      @hop[:myrcene_min] = h["myrceneMin"]
      @hop[:myrcene_max] = h["myrceneMax"]
      @hop[:farnesene_min] = h["farneseneMin"]
      @hop[:farnesene_max] = h["farneseneMax"]
      @hop[:is_noble] = h["isNoble"]
      @hop[:for_bittering] = h["forBittering"]
      @hop[:for_flavor] = h["forFlavor"]
      @hop[:for_aroma] = h["forAroma"]
      Hop.create(@hop)
    end
  end
end

# Seeds Yeast
# ====================================================================
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
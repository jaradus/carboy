class Hop < ActiveRecord::Base

attr_accessible :name, :api_id, :description, :country_iso_code, :alpha_acid_min, :alpha_acid_max, :beta_acid_min, :beta_acid_max, :humulene_min, :humulene_max, :caryophyllene_min, :caryophyllene_max, :cohumulone_min, :cohumulone_max, :myrcene_min, :myrcene_max, :farnesene_min, :farnesene_max, :is_noble, :for_bittering, :for_flavor, :for_aroma

  def self.update_database
    hops_pages = HTTParty.get("http://api.brewerydb.com/v2/hops/?key=#{ENV['BREWERYAPI_KEY']}&p=all")["numberOfPages"]

    (1..hops_pages).each do |page|
      hops = HTTParty.get("http://api.brewerydb.com/v2/hops/?key=#{ENV['BREWERYAPI_KEY']}&p=#{page}")["data"]
      
      hops.each do |f|
        @hop = {}
        unless Hop.find_by_name(f['name'])
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
  end

end
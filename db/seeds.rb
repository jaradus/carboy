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
    if Fermentable.find_by_name(f['name'])
      puts "[fermentable] #{f['name']} already exists in database"
    else
      @fermentable[:api_id] = f["id"]
      @fermentable[:name] = f["name"]
      @fermentable[:description] = f["description"]
      @fermentable[:country_iso_code] = f["country"] && f["country"]["displayName"]
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
        fermentable_seed = Fermentable.create(@fermentable)
        puts "[fermentable] #{fermentable_seed.name} created"
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
    if Hop.find_by_name(h['name'])
      puts "[hop] #{h['name']} already exists in database"
    else
      @hop[:name] = h["name"]
      @hop[:api_id] = h["id"]
      @hop[:description] = h["description"]
      @hop[:country_iso_code] = h["country"] && h["country"]["displayName"]
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
      hop_seed = Hop.create(@hop)
      puts "[hop] #{hop_seed.name} created"
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
    if Yeast.find_by_name(y['name'])
      puts "[yeast] #{y['name']} already exists in database"
    else
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
      @yeast[:product_id] = y["productId"]
      @yeast[:yeast_format] = y["yeastFormat"]
      @yeast[:category] = y["category"]
      yeast_seed = Yeast.create(@yeast)
      puts "[yeast] #{yeast_seed.name} created"
    end
  end
end

# Seeds Regional Styles
# ====================================================================
styles = HTTParty.get("http://api.brewerydb.com/v2/styles/?key=#{ENV['BREWERYAPI_KEY']}")["data"]
  
styles.each do |s|
  @style = {}
  if RegionalStyle.find_by_name(s['name'])
    puts "[regional style] #{s['name']} already exists in database"
  else
    @style[:name] = s['name']
    @style[:description] = s['description']
    @style[:api_id] = s['id']
    @style[:beer_category] = s['category']['name']
    @style[:ibu_min] = s['ibuMin']
    @style[:ibu_max] = s['ibuMax']
    @style[:abv_min] = s['abvMin']
    @style[:abv_max] = s['abvMax']
    @style[:srm_min] = s['srmMin']
    @style[:srm_max] = s['srmMax']
    @style[:og_min] = s['ogMin'] ? s['ogMin'].to_f*1000 : 9999
    @style[:og_max] = s['ogMax'] ? s['ogMax'].to_f*1000 : 9999
    @style[:fg_min] = s['fgMin'] ? s['fgMin'].to_f*1000 : 9999
    @style[:fg_max] = s['fgMax'] ? s['fgMax'].to_f*1000 : 9999

    regionalstyle_seed = RegionalStyle.create(@style)
    puts "[regional style] #{regionalstyle_seed.name} created"
  end
end

# Northern Brewer Recipe Scrape
# ====================================================================
require 'open-uri'
require 'nokogiri'

data = Nokogiri::HTML(open("http://www.northernbrewer.com/shop/brewing/recipe-kits/extract-kits?dir=asc&limit=all&mode=list&order=name"))

products_list = data.css('ol.products-list')
item_list = products_list.css('li.item')


@items = item_list.children.length
# Get the product page link
(1..@items).step(5) do |n|
  link = item_list.children[n]["href"] #Start at 1 and go every 5
  product_page = Nokogiri::HTML(open(link))
  
  # Get the beer name from the product page
    product_name = product_page.css('div.product-name')
    @beer_name = product_name.children[1].children[0].to_s # This is the beer's name

  # Get the beer image from the product page
    @image_url = product_page.css('div.product-img-box p.product-image').children[1]["href"] # This is the beer's image

  # Get the beer description from the product page
    product_description = product_page.css('div.std').to_s # This is the beer's description with html tags
    pd_two = product_description.gsub(/<\/?[^>]*>/, '') # This is the beer's description cleaned of links and HTML tags
    pd_three = pd_two.gsub(/ *\n+/, '')
    @beer_description = pd_three.gsub(/ *\r+/, '').strip

  # Gets the table with the beer's additional information
    product_details = product_page.css('div.product-collateral div.collateral-box table.data-table tbody')
    @country_style = product_page.css('div.product-collateral div.collateral-box table.data-table tbody td.data').children[2].to_s
    @beer_style = product_page.css('div.product-collateral div.collateral-box table.data-table tbody td.data').children[3].to_s
    @color = product_page.css('div.product-collateral div.collateral-box table.data-table tbody td.data').children[4].to_s
    @original_gravity = product_page.css('div.product-collateral div.collateral-box table.data-table tbody td.data').children[5].to_s.to_i
    @time_to_make = product_page.css('div.product-collateral div.collateral-box table.data-table tbody td.data').children[6].to_s.to_i
    @time_unit = product_page.css('div.product-collateral div.collateral-box table.data-table tbody td.data').children[6].to_s.split(" ")[1]
    @recipe_link = product_page.css('div.product-collateral div.collateral-box table.data-table tbody td.data').children[1]["href"]

  if Beer.find_by_name(@beer_name)
    puts "[beer] #{@beer_name} already in database"
  else
    beer_seed = Beer.create({
        name: @beer_name,
        description: @beer_description,
        beer_style: @beer_style,
        color: @color,
        original_gravity: @original_gravity,
        time_to_make: @time_to_make,
        time_unit: @time_unit,
        image_url: @image_url,
        country_style: @country_style,
        recipe_link: @recipe_link
      })
    puts "[beer] #{beer_seed.name} created"
  end
end


# Seed Complete Notification
# ====================================================================
puts "***************************"
puts "Seed successfully completed"
puts "***************************"




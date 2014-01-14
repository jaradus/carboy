require 'spec_helper'

# describe 'A batch should have fermentables, hops, yeast, and specialty grain' do
#   before :all do
#     @fermentable = Fermentable.create({
#       name: "Beer 1"
#       })
#     @hop = Hop.create({
#       name: "Hop 1"
#       })
#     @yeast = Yeast.create({
#       hop: "Yeast 1"
#       })
#     @specialty = Specialty.create({
#       name: "Simpsons CaraMalt",
#       description: "30-37° L. Made from green malt. Imparts a light flavor, and slight red hue. Great for dark lagers and ales. Will contribute dextrins and add to foam stability. This grain may be steeped or mashed.",
#       type: "Steeping grain"
#       })
#     @beer = Beer.create({
#       name: "Beer 1"
#       })
#     @batch = Batch.create({
#             name: "January 2014 run",
#             description: @beer.name,
#             notes: "By the book brew",
#             label_url: @beer.image_url,
#             rating: 5,
#             original_gravity: @beer.original_gravity,
#             brew_date: "2014-01-20",
#             secondary_date: "2014-02-20",
#             bottling_date: "2014-03-21",
#             beer_id: @beer,
#             fermentables_attributes: @fermentable,
#             hops_attributes: @hop,
#             yeasts_attributes: @yeast,
#             specialties_attributes: @specialty
#           })
#   end
#   describe 'it should have a beer name' do
#     @batch.beer.name.should eq("Beer 1")
#   end
#   describe 'it should have a fermentable' do
#     @batch.fermentable.name.should eq("Fermentable 1")
#   end
#   describe 'it should have a hop' do
#     @batch.hop.name.should eq("Hop 1")
#   end
#   describe 'it should have a yeast' do
#     @batch.yeast.name.should eq("Yeast 1")
#   end
#   describe 'it should have a specialty grain' do
#     @batch.specialty.name.should eq("Simpsons CaraMalt")
#   end


# end



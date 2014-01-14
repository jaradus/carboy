require 'spec_helper'

describe 'A batch should have fermentables, hops, yeast, and specialty grain' do
  before :all do
    @fermentable = Fermentable.find(1)
    @hop = Hop.find(1)
    @yeast = Yeast.find(1)
    @specialty = Specialty.create({
      name: "Simpsons CaraMalt",
      description: "30-37° L. Made from green malt. Imparts a light flavor, and slight red hue. Great for dark lagers and ales. Will contribute dextrins and add to foam stability. This grain may be steeped or mashed.",
      type: "Steeping grain"
      })
    @batch = Batch.create()
  end



end
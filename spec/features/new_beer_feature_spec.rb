require 'spec_helper'

describe "New Beer" do
  before :all do
    fermentable = HTTParty.get("http://api.brewerydb.com/v2/fermentable/166/?key="+ENV['BREWERYAPI_KEY'])
    new_fermentable = Fermentable.create(
      fermentable["data"]
      )
  end
  describe "Given a new beer name" do
    before do
      visit new_beer_path
      @beer_name = "Summer IPA"
      fill_in "beer_name", with: @beer_name
      click_button "Create Beer"
    end
    describe "I should visit the beer edit page"
      before do
        @beer_field = find_field("beer_name")
      end
      it "has the name of the new beer" do
        @beer_field.value.should == @beer_name
      end
      describe "And I select a fermentable and submit" do
        before do
          @fermentable = Fermentable.find_by_name("English Black Malt")
          check(@fermentable.name)
          click_button "Submit Changes"
          @beer_id = Beer.find_by_name(@beer_name)
          # @fermentable_field = find_field("fermentables")
        end
        it "should take us to the beer's description page" do
          current_path.should == beer_path(@beer_id)
        end
        it "and the description page should contain the selected fermentable" do
          page.should have_content(@fermentable.name)
        end
  end
end




end
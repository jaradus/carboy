require 'spec_helper'

describe "Create a new beer" do
  before do
    visit new_beer_path
  end
  it "page should be the new beer page" do
    current_path.should == new_beer_path
  end

  describe "Given a new beer name" do
    before do
      @beer_name = "Summer IPA"
      fill_in "beer_name", with: @beer_name
      click_button "Create Beer"
    end
    describe "I should visit the beer edit page"
      before do
        @beer_id = Beer.find_by_name(@beer_name)
      end
      it "should be the edit page" do
        current_path.should == edit_beer_path(@beer_id)
      end
  end

end
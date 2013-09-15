require 'spec_helper'

describe "Reviews" do
  describe "GET /reviews" do
    it "does not get the page as user is not logged in" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get reviews_path
      response.status.should be(302)
    end
    it "should have the heading 'View Paper Reviews'" do
      visit "/reviews"
      expect(page).to have_content('View Paper Reviews')
    end
  end
end

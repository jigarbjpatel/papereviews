require 'spec_helper'

describe "Reviews" do
subject { page }

  describe "GET /reviews without logging in" do
    it "does not get the page as user is not logged in" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get reviews_path
      response.status.should be(302)
    end
  end
  describe "reviews page with valid login" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      visit new_user_session_path
      fill_in "Email",    with: user.email.upcase
      fill_in "Password", with: user.password
      click_button "Sign in"
    end
    it "should have the heading 'View Paper Reviews'" do      
      visit reviews_path
      expect(page).to have_content('View Paper Reviews')
    end
  end
end

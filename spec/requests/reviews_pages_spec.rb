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
      sign_in user
    end
    it "should have the heading 'View Paper Reviews'" do      
      visit reviews_path
      expect(page).to have_content('View Paper Reviews')
    end
	
    describe "Create Review" do

      before { visit  new_review_path}
      let(:submit) { "Save Review" }
      
      describe "with invalid information" do
        it "should not create a review" do
          expect { click_button submit }.not_to change(Review, :count)
        end
      end

      describe "with valid information" do
        before do
          fill_in "Paper Title", with: "RSpec is great!"
          fill_in "Summary",     with: "RSpec is great but only if you are great:)"
          fill_in "Review Date", with: "2013-08-22"
	  fill_in "Comments" ,  with: "RSpec picks up field names magically!!"
        end

        it "should create a review" do
          expect { click_button submit }.to change(Review, :count).by(1)
        end
	
	describe "after saving the review" do
          before { click_button submit }
          let(:review) { Review.find_by(paper_title: 'RSpec is great!') }

          it { should have_link('Back to all reviews') }
          it { should have_content(review.paper_title) }
        end

      end

      describe "edit" do
	let(:review) { FactoryGirl.create(:review) }
        let(:submit) { "Save Review" }
        before { visit edit_review_path(review) }

        describe "page" do
          it { should have_content("Edit review") }
        end
	describe "with invalid information" do
          before do
	    fill_in "Paper Title", with: ""
            click_button "Save Review" 
	  end          
          it { should have_content('error') }
        end             

        describe "with valid information" do
	  let(:new_paper_title)  { "New Paper Title" }
          before do
            fill_in "Paper Title", with: new_paper_title
            click_button "Save Review"
          end
          specify { expect(review.reload.paper_title).to  eq new_paper_title }
	end
      end

    end
  end
end

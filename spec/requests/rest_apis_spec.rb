require 'spec_helper'

describe "RestApis" do
include Rack::Test::Methods

  let(:user) { FactoryGirl.create(:user) }
   before do
      sign_in user 
	@review = user.reviews.build(paper_title: "Sample Paper 1", summary: "paper_summary", review_date: "2013-08-30")
	  @reviews = [
	    user.reviews.build(paper_title: "Sample Paper 1", summary: "paper_summary", review_date: "2013-08-30"),
	    user.reviews.build(paper_title: "Sample Paper 2", summary: "paper_summary", review_date: "2013-08-30")
	  ]     
   
end  
   
   describe 'API' do
   it "should return json errors with no token" do
    get '/reviews.json'
    error = { :error => "You need to sign in or sign up before continuing." }
    last_response.body.should eql(error.to_json)
  end
end   
end

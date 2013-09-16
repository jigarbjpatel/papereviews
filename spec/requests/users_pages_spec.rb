require 'spec_helper'

describe "User Pages" do
  subject { page }

  describe "registration" do

    before { visit new_user_registration_path }

    let(:submit) { "Sign up" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "test1234"
        fill_in "Password confirmation", with: "test1234"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }

        it { should have_link('Logout') }
        it { should have_content(user.email) }
      end
    end

  end
end

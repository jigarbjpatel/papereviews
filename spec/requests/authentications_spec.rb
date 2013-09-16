require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin" do
    before { visit new_user_session_path }

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_selector('p.alert', text: 'Invalid email or password.') }
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      it { should have_link('Logout',    href: destroy_user_session_path) }
      it { should_not have_link('Sign in', href: new_user_session_path) }

      describe "followed by log out" do
        before { click_link "Logout" }
        it { should_not have_link('Logout') }
      end
    end
  end
end

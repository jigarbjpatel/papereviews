require 'spec_helper'

describe User do
  before { @user = User.new(email: "user@example.com", password:"test1234") }

  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:password) }

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when password is not present" do
    before { @user.password = " " }
    it { should_not be_valid }
  end

  describe "when email is too long" do
    before { @user.email = "a" * 256 }
    it { should_not be_valid }
  end
  describe "when password is too small" do
    before { @user.email = "a" * 7 }
    it { should_not be_valid }
  end
  describe "when email format is not valid" do
    it "should be invalid" do
      emails = %w[asadfa@asdf. sadfa@sdf,com sdfasd.com]
      emails.each do |e|
	@user.email = e 
	expect(@user).not_to be_valid
      end 
    end
  end
  describe "when email format is valid" do
    it "should be valid" do
      emails = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      emails.each do |e|
        @user.email = e
        expect(@user).to be_valid
      end
    end
  end

  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

end

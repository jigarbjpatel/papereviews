require 'spec_helper'

describe Review do
  before { @review = Review.new(paper_title: "Sample Paper 1", summary: "paper_summary", review_date: "2013-08-30") }

  subject { @review }

  it { should respond_to(:paper_title) }
  it { should respond_to(:summary) }
  it { should respond_to(:review_date) }

  it { should be_valid }
  
  describe "when paper_title is not present" do
    before { @review.paper_title = " " }
    it { should_not be_valid }
  end

  describe "when summary is not present" do
    before { @review.summary = " " }
    it { should_not be_valid }
  end

  describe "when review_date is not present" do
    before { @review.review_date = " " }
    it { should_not be_valid }
  end

  describe "when title is too long" do
    before { @review.paper_title = "a" * 256 }
    it { should_not be_valid }
  end
  describe "when author is too long" do
    before { @review.author = "a" * 256 }
    it { should_not be_valid }
  end
  describe "when summary is too long" do
    before { @review.summary = "a" * 256 }
    it { should_not be_valid }
  end

  describe "when key_points is too long" do
    before { @review.key_points = "a" * 1001 }
    it { should_not be_valid }
  end
  describe "when comments is too long" do
    before { @review.comments = "a" * 1001 }
    it { should_not be_valid }
  end
  describe "when citation_info is too long" do
    before { @review.citation_info = "a" * 1001 }
    it { should_not be_valid }
  end
  describe "when paper_source is too long" do
    before { @review.paper_source = "a" * 1001 }
    it { should_not be_valid }
  end
  describe "when review_link is too long" do
    before { @review.review_link = "a" * 1001 }
    it { should_not be_valid }
  end

end

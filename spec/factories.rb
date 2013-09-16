FactoryGirl.define do
  factory :user do
    email    "test@test.com"
    password "test1234"
    password_confirmation "test1234"
  end

  factory :review do
    paper_title "Sample Paper Title"
    summary "Sample summary of paper"
    review_date "2013-08-31"
    user_id "1"
  end
end

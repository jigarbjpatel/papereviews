class AddColumnsToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :paper_title, :string
    add_column :reviews, :author, :string
    add_column :reviews, :paper_source, :string
    add_column :reviews, :summary, :string
    add_column :reviews, :key_points, :string
    add_column :reviews, :comments, :string
    add_column :reviews, :citation_info, :string
    add_column :reviews, :review_date, :date
    add_column :reviews, :review_link, :string
  end
end

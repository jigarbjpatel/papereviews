class AddRelationshipKeyToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :user_id, :integer
    add_index :reviews, [:user_id, :review_date]
  end
end

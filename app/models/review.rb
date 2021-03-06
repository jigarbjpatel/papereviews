class Review < ActiveRecord::Base

  belongs_to :user
  default_scope -> { order('review_date DESC') }
	validates(:user_id, presence: true)
	validates(:paper_title, presence: true, length: {maximum: 255})
	validates(:summary, presence: true, length: {maximum: 255})
	validates(:review_date, presence: true,  length: {maximum: 10})
	validates(:author, length: {maximum: 255})
	validates(:paper_source, length: {maximum: 1000})
	validates(:key_points, length: {maximum: 1000})
	validates(:comments, length: {maximum: 1000})
	validates(:review_link, length: {maximum: 1000})
	validates(:citation_info, length: {maximum: 1000})

  def self.search(query,u)
    # where(:title, query) -> This would return an exact match of the query
    where("paper_title like ?", "%#{query}%").where("user_id = ?", u.id) 
  end

end

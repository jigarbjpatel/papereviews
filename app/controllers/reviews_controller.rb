class ReviewsController < ApplicationController
before_filter :authenticate_user!

  def index
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
#    @review = current_user.reviews.build(review_params)
    if @review.save
      # flash[:success] = "Review created!"
      redirect_to @review
    else
      render 'new'
    end
  end

  def edit
    @review = Review.find(params[:id])
#check for authorization
    
  end
  
  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to @review
    else
      render 'edit'
    end
  end
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to root_url
  end

  private
  def review_params
    params.require(:review).permit(:paper_title, :author, :paper_source, :summary, :key_points, :comments, :citation_info, :review_date, :review_link)
  end

end

class ReviewsController < ApplicationController
before_filter :authenticate_user!

  def index
    if params[:search]
      @reviews = Review.search(params[:search]).order("review_date DESC")
    else
      @reviews = Review.order("review_date DESC")
    end  
    respond_to do |format|            
      format.html 
      format.js 
      format.xml do
	render :xml => @reviews.to_xml(:include => {:user => { :only => :email}})
      end
      format.json do
        render :json => @reviews.to_json(:include => {:user => { :only => :email}})
      end
    end 
  end

  def show
    @review = Review.find(params[:id])
    respond_to do |format|
      format.html
      format.xml {render :xml => @review.to_xml(:include => {:user => {:only => :email}})}
      format.json  {render :json => @review.to_json(:include => {:user => {:only => :email}})}
    end
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    #@review = current_user.reviews.build(review_params)
    
    respond_to do |format|     
        if @review.save
	 format.html do     
	     # flash[:success] = "Review created!"
          redirect_to @review
	 end
          format.xml {render :xml => @review.to_xml(:include => {:user => {:only => :email}})}
          format.json  {render :json => @review.to_json(:include => {:user => {:only => :email}})}	
        else
	  format.html do
            render 'new'
	  end
        end  
    end
  end
    
  
  def edit
    @review = Review.find(params[:id])
  end
  
  def update
    @review = Review.find(params[:id])
    respond_to do |format|
      format.html do
        if @review.update(review_params)
          redirect_to @review
        else
          render 'edit'
        end
      end
      format.xml {render :xml => @review.to_xml(:include => {:user => {:only => :email}})}
      format.json  {render :json => @review.to_json(:include => {:user => {:only => :email}})}	
    end
  end

  def destroy
    @review = Review.find(params[:id])
    respond_to do |format|        
      if @review.destroy        
        format.json { head :no_content, status: :ok }
        format.xml { head :no_content, status: :ok }
      else
        format.json { render json: @review.errors, status: :unprocessable_entity }
        format.xml { render xml: @review.errors, status: :unprocessable_entity }
      end 
        format.html {redirect_to(root_url)}
	format.js {render :nothing=>true}
    end
  end

  private
  def review_params
    params.require(:review).permit(:paper_title, :author, :paper_source, :summary, :key_points, :comments, :citation_info, :review_date, :review_link)
  end

end

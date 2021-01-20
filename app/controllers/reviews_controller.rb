class ReviewsController < ApplicationController
  def index
  end

  def show
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:id])
  end

  def new
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.build
  end

  def create
    @review = Review.new(description:params[:review][:description])
    @review.user_id =  session[:user_id]
    @review.movie_id =  params[:movie_id]
    if @review.save
      redirect_to movie_review_path(params[:movie_id], @review)
    else 
      render :new 
    end 
  end

  def edit
  end

  def update
  end

  def destory
  end 

  private 
   def review_params
    permit(:review).require(:description)
   end 
end
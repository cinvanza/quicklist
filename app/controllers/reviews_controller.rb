class ReviewsController < ApplicationController
before_action :set_list, only: %i[new create index]

  def index
    @reviews = Review.where(list_id: params[:list_id])
    @review = Review.new
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @list = List.find(params[:list_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.list_id = @list.id
    @review.user = current_user
    if @review.save
      redirect_to list_reviews_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end

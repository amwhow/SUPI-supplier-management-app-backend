class ReviewsController < ApplicationController
  before_action :authenticate_user
  before_action :set_review, only: %i[show update destroy]

  def index
    @reviews = current_user.Review.all
    render json: @reviews
  end

  def show
    render json: @review
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      render status: :created
    else
      render status: :bad_request
    end
  end

  def update
    if @review.update(purchase_order_id: @review.purchase_order_id, qualityRating: params[:qualityRating],
                      reliabilityRating: params[:reliabilityRating], costRating: params[:costRating], comment: params[:comment])
      render status: :no_content
    else
      render status: :bad_request
    end
  end

  def destroy
    @review.destroy
  end

  private

  def review_params
    params.require(:review).permit(:purchase_order_id, :qualityRating, :reliabilityRating, :costRating, :comment)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end

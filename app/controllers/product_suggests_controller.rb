class ProductSuggestsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_login!
  before_action :load_categories, except: [:index, :destroy]

  def new
    @product_suggest = ProductSuggest.new
  end

  def show
  end

  def create
    @product_suggest = ProductSuggest.new product_suggest_params
    if @product_suggest.save
      flash[:success] = t "flash.success.create"
      redirect_to product_suggest_path @product_suggest
    else
      render :new
    end
  end

  private

  def product_suggest_params
    params.require(:product_suggest)
      .permit(:product_name, :description, :image, :category_id)
      .merge! user: current_user
  end

  def load_categories
    @categories = Category.order_name
  end
end

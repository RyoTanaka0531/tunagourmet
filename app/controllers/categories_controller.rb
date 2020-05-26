class CategoriesController < ApplicationController
  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to categories_path
  end

  def index
    @categories = Category.all
    @category = Category.new
  end
  private
  def category_params
    params.require(:category).permit(:name)
  end
end

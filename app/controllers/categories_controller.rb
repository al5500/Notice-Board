class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params

    if @category.save
      redirect_to '/categories'
    else
      redirect_to '/catgories/new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    category = Category.find params[:id]
    category.destroy
    redirect_to categories_path
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end

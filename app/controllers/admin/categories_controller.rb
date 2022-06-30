class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USER'], password: ENV['ADMIN_PWD']

  def index
    @category_count = Category.count
    @categories = Category.order(id: :desc).all

  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'New Category created!'
    else
      render :new
    end
  end

  private 

  def category_params
    params.require(:category).permit(
      :name,
    )
  end
end

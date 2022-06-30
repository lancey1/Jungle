class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USER'], password: ENV['ADMIN_PWD']

  def show
    @product_count = Product.sum(:quantity)
    @category_count = Category.count
  end
end

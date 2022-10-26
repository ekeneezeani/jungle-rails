

class Admin::DashboardController < ApplicationController
 
  http_basic_authenticate_with name: ENV["HTTP_BASIC_USER"],
                              password: ENV["HTTP_BASIC_PASSWORD"],
                              if: -> { ENV["HTTP_BASIC_PASSWORD"].present? }
  
  def show
    @count = Product.all

    @all_products = Product.all
    
    @count = @all_products.size
 
    @categories = @all_products.select(:category_id).distinct
    @category_list =[];
    @categories.each do |e|
      @category_list.push(Category.find(e.category_id).name)
    end
    
    puts "CATEGORIES  #{@category_list}"
  end
end

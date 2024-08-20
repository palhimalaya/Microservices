# app/controllers/products_controller.rb
class ProductsController < ApplicationController
  def availability
    product = Product.find_by(id: params[:product_id])

    if product && product.quantity >= params[:quantity].to_i
      render json: { available: true }
    else
      render json: { available: false }
    end
  end
end

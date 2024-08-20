require 'httparty'

class OrdersController < ApplicationController
  def index
  end

  def create
    response = HTTParty.get('http://localhost:4003/products/availability', query: { product_id: params[:order][:product_id] })

    if response.success? && response['available']
      Order.create(order_params)

      publish_to_rabbitmq(params[:order])
      redirect_to root_path, notice: 'Order placed successfully'
    else
      redirect_to root_path, alert: 'Product not available'
    end
  end

  private

  def order_params
    params.require(:order).permit(:customer_name, :product_id, :quantity, :address)
  end

  def publish_to_rabbitmq(order_params)
    order = order_params.merge(id: Order.last.id)
    channel = RABBITMQ_CONNECTION.create_channel
    exchange = channel.default_exchange
    exchange.publish(order.to_json, routing_key: 'orders')
  end
end

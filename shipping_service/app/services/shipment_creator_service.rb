# app/services/shipment_creator_service.rb
class ShipmentCreatorService
  def self.run
    channel = RABBITMQ_CONNECTION.create_channel
    queue = channel.queue('orders')

    queue.subscribe do |delivery_info, properties, payload|
      create_shipment(JSON.parse(payload))
    end
  end

  def self.create_shipment(order_params)
    # Create shipment logic
    shipment = Shipment.create(order_id: order_params['id'], address: order_params['address'], customer_name: order_params['customer_name'], status: 'pending')
    data = { shipment: shipment.as_json }
    ActionCable.server.broadcast('shipments_channel', data)
  end
end

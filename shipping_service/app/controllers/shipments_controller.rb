# app/controllers/shipments_controller.rb
class ShipmentsController < ApplicationController
  def index
    @shipments = Shipment.all
  end
end

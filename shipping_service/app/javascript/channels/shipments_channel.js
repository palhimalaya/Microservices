import consumer from "channels/consumer"

consumer.subscriptions.create("ShipmentsChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected to ShipmentsChannel");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log("Disconnected from ShipmentsChannel");
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log("Received data: ", data);
    const shipment = data.shipment;
    const shipmentsElement = document.getElementById('shipments');
    shipmentsElement.innerHTML += `
      <div>
        <p><strong>Customer Name:</strong> ${shipment.customer_name}</p>
        <p><strong>Order ID:</strong> ${shipment.order_id}</p>
        <p><strong>Address:</strong> ${shipment.address}</p>
        <p><strong>Status:</strong> ${shipment.status}</p>
      </div>`;
  }
});

import consumer from "./consumer"

consumer.subscriptions.create("ProductsChannel", {
  connected() {
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    const storeElement = document.querySelector("main.store");
    if(storeElement) {
      storeElement.innerHTML = data.html
    }
  }
});

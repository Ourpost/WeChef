import { Controller } from "stimulus";

export default class extends Controller {
  static values = {
    orderId: String,
  };

  pay() {
    fetch(`/orders/${this.orderIdValue}/order_state`)
      .then((resp) => {
        return resp.json();
      })
      .then(({ state }) => console.log(state));
  }

  hide() {
    this.element.classList.toggle("hidden");
  }
}

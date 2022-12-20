import { Controller } from "stimulus";

export default class extends Controller {
  static values = {
    orderId: String,
  };

  connect() {
    console.log("display");
  }

  hide() {
    this.element.classList.toggle("hidden");
  }
}

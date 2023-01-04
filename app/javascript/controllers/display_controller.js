import { Controller } from "stimulus";

export default class extends Controller {
  static values = {
    orderId: String,
  };

  hide() {
    this.element.classList.toggle("hidden");
  }
}

import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [];

  connect() {
    console.log("display");
  }

  hide() {
    this.element.classList.toggle("hidden");
  }
}

import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["btn", "dropdown-btn"];

  connect() {
    console.log("我在這頁面");
  }

  siderbarbtn() {
    this["dropdown-btnTarget"].classList.toggle("hidden");
    console.log(this["dropdown-btnTarget"].classList);
  }
}

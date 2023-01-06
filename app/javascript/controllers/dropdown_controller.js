import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["btn", "dropdown-btn"];

  siderbarbtn() {
    this["dropdown-btnTarget"].classList.toggle("hidden");
    console.log(this["dropdown-btnTarget"].classList);
  }
}

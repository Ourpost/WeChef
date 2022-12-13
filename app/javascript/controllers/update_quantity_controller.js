import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["quantity", "link"];

  connect() {
    this.min = +this.quantityTarget.min;
    this.max = +this.quantityTarget.max;
    this.serialNumber = this.linkTarget.dataset.serialNumber;
    console.log(this.serialNumber);
  }

  decrement(e) {
    e.preventDefault();
    const q = +this.quantityTarget.value;
    if (q > this.min) {
      this.setQuantity(q - 1);
    }
  }

  increment(e) {
    e.preventDefault();
    const q = +this.quantityTarget.value;

    if (q < this.max) {
      this.setQuantity(q + 1);
    }
  }

  setQuantity(n) {
    this.quantityTarget.value = n;
    this.linkTarget.search = `?quantity=${n}&serial_number=${this.serialNumber}`;

    // const evt = new CustomEvent("update-quantity", {
    //   detail: { quantity: n },
    // });
    // document.dispatchEvent(evt);
  }
}

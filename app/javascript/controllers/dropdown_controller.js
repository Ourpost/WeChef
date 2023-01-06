import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ "btn"]

  connect() {
    console.log("我在這頁面");
  }
  
  siderbarbtn(){
    console.log(this.btnTarget);
  }
}
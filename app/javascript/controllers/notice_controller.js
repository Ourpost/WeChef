import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["notice", "alert"];

  initialize(){
    setTimeout(() => {
      this.noticeTarget.remove()      
    }, 3000);
    setTimeout(() => {
      this.alertTarget.remove()      
    }, 3000);
  }
}

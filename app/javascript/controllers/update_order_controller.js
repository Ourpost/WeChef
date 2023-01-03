import { Controller } from "stimulus";
import consumer from "../channels/consumer";

export default class extends Controller {
  static values = {
    deskId: String,
  };

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "DesksChannel", id: this.deskIdValue },
      {
        connected: this._cableConnected.bind(this),
        disconnected: this._cableDisconnected.bind(this),
        received: this._cableReceived.bind(this),
      }
    );
  }

  _cableConnected() {
    const el = document.getElementById(`desk_${this.deskIdValue}`);
  }

  _cableReceived(data) {
    const el = document.getElementById(`desk_${this.deskIdValue}`);
    el.insertAdjacentHTML("beforeend", data);
  }
}

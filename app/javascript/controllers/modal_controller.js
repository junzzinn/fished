// app/javascript/controllers/modal_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["modal"];

  connect() {
    this.hideModal();
  }

  showModal() {
    this.modalTarget.classList.add("is-active");
  }

  hideModal() {
    this.modalTarget.classList.remove("is-active");
  }
}

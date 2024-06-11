// app/javascript/controllers/favorite_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  toggle(event) {
    event.preventDefault();
    const icon = event.currentTarget.querySelector("i");
    icon.classList.toggle("fas");
    icon.classList.toggle("far");
  }
}

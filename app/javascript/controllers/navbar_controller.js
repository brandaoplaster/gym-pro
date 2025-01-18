import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["menu"];

  connect() {
    console.log("Navbar controller connected");
  }

  toggle() {
    this.menuTarget.classList.toggle("hidden");
  }
}

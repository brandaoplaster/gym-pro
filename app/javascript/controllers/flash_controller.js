import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash"
export default class extends Controller {
  static targets = ["flashMessage"]

  connect() {
    console.log("controller flash")
    if (this.hasFlashMessageTarget) {
      setTimeout(() => {
        this.fadeOut()
      }, 3000)
    }
  }

  fadeOut() {
    this.flashMessageTarget.classList.add("opacity-0", "translate-y-[-10px]")
    setTimeout(() => {
      this.flashMessageTarget.remove()
    }, 500)
  }
}

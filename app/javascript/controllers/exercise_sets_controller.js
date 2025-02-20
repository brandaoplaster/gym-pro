import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["exerciseSet", "template"]

  connect() {
    console.log("exercises");
  }

  addExercise(event) {
    event.preventDefault()

    if (this.allExercisesSelected()) {
      let template = this.templateTarget.innerHTML
      let content = template.replace(/NEW_RECORD/g, new Date().getTime())
      this.element.insertAdjacentHTML('beforeend', content)
    } else {
      this.showAlert("Please select an exercise for all sets before adding a new one.")
    }
  }

  allExercisesSelected() {
    let selects = this.element.querySelectorAll('select[name$="[exercise_id]"]');
    return Array.from(selects).every(select => select.value !== "");
  }

  showAlert(message) {
    alert(message);
  }

  removeExercise(event) {
    event.preventDefault()
    let item = event.target.closest('.nested-fields')
    let destroyInput = item.querySelector("input[name*='_destroy']")

    if (destroyInput) {
      destroyInput.value = 1
      item.style.display = 'none'
    } else {
      item.remove()
    }
  }
}

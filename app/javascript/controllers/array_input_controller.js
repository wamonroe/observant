import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "container", "input", "template" ]

  add(event) {
    event.preventDefault()
    var content = this.templateTarget.innerHTML.replace(/\s*disabled="disabled"\s*/g, ' ')
    this.containerTarget.innerHTML += content
  }

  remove(event) {
    event.preventDefault()
    event.target.closest('[data-target="array-input.input"]').remove()
  }

  set(event) {
    event.target.setAttribute('value', event.target.value)
  }
}

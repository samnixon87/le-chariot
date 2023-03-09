import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="mark-complete"
export default class extends Controller {
  connect() {
    console.log('hi', this.element)
  }
}

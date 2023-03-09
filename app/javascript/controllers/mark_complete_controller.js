import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="mark-complete"
export default class extends Controller {

  markComplete(e) {
    this.element.classList.add("green-background")
    document.querySelector('#pinned').display = "none";
    document.querySelector('#pinned').innerHTML = "Undo"
  }
}

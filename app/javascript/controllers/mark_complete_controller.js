import { Controller } from "@hotwired/stimulus"
import { csrfToken } from "@rails/ujs"

// Connects to data-controller="mark-complete"
export default class extends Controller {
  static targets = ["like"]

  connect() {
    console.log(this.element)
    this.element.scrollIntoView();
  }

  markComplete(e) {
    e.preventDefault()
    this.element.classList.add("green-background")
    console.log(e.target)
    // document.querySelector('#pinned').display = "none";
    // document.querySelector('#pinned').innerHTML = "Undo";

    fetch(e.target.href, {
      method: "POST",
      headers: { "Accept": "application/json", "X-CSRF-Token": csrfToken() },
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
      })
  }
}

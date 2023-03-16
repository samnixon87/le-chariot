import { Controller } from "@hotwired/stimulus"
import { csrfToken } from "@rails/ujs"

// Connects to data-controller="mark-complete"
export default class extends Controller {
  static targets = ["like", "count"]

  connect() {
    console.log(this.element)
    this.element.scrollIntoView();
    console.log(this.countTarget.dataset.likeCount)
  }

  markComplete(e) {
    e.preventDefault()
    this.element.classList.add("green-background")
    e.target.parentElement.parentElement.remove()

    let newLike = Number.parseInt(this.countTarget.dataset.likeCount, 10) + 1
    this.countTarget.innerText = newLike

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

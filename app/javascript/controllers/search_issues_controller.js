import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-issues"
export default class extends Controller {
  static targets = ["form", "input", "list"]

  connect() {
    console.log(this.formTarget)
    console.log(this.inputTarget)
    console.log(this.listTarget)
  }

  update() {
    if (this.inputTarget.value.length > 0) {
      const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
      fetch(url, {headers: {"Accept": "text/plain"}})
        .then(response => response.text())
        .then((data) => {
          this.listTarget.outerHTML = data
        })
    }
    // else
    // this.listTarget.outerHTML = data
  }
}

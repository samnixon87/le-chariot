import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="copy"
export default class extends Controller {
  static targets = ["text", "button"]
  connect() {
  }
  copyText() {
    // Copy the text inside the text field
    navigator.clipboard.writeText(this.textTarget.innerText)
      .then(() => {
        alert("Copied the text: " + this.textTarget.innerText);
      })
    ;
  }
}

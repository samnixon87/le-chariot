import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dark-mode"
export default class extends Controller {
  static targets = ["toggle"]

  connect() {
    console.log("dark mode controller connected")
    this.loadDarkModeStateFromCookie()
  }

  toggle() {
    console.log("Toggle clicked!")
    this.element.classList.toggle("dark-mode")
    this.saveDarkModeStateToCookie()
  }

  saveDarkModeStateToCookie() {
    document.cookie = "dark_mode=" + this.element.classList.contains("dark-mode")
  }

  loadDarkModeStateFromCookie() {
    const darkModeState = document.cookie.match(/^(.*;)?\s*dark_mode\s*=\s*([^;]+)(.*)?$/)
    if (darkModeState && darkModeState[2] === "true") {
      this.element.classList.add("dark-mode")
      // console.log(this.toggleTarget.previousElementSibling)
      this.toggleTarget.previousElementSibling.checked = true
    }
  }
}

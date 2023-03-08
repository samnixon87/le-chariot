import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="issues"
export default class extends Controller {
  static targets = ["messages"]

  connect() {
    console.log(this.element)
    // console.log(this.element.href.value)
  }

  render(event) {
    event.preventDefault()
    console.log(event.target.href)
    // console.log(this.myForm)

    event.target.classList.add("active")

    const url = `${event.target.href}`
    fetch(url)
      .then(response => response.text())
      .then((data) => {
        console.log(data)
    })
  }
}

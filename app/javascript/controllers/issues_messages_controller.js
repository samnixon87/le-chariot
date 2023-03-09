import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="issues"
export default class extends Controller {
  static targets = ["messages", "issueLink"]

  connect() {
    // console.log(this.element.href.value)
  }

  render(event) {
    event.preventDefault()
    // console.log(this.myForm)

    this.issueLinkTargets.forEach((issueLink) => {
      issueLink.parentElement.classList.remove("active")
    })

    event.target.parentElement.classList.add("active")

    const url = `${event.target.href}`
    fetch(url, {headers: {"Accept": "application/json"}})
      .then(response => response.json())
      .then((data) => {
        this.messagesTarget.innerHTML = ("afterbegin", data.content)
    })
  }
}

import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="issue-subscription"
export default class extends Controller {
  static values = { issueId: Number }
  static targets = ["messages"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "IssueChannel", id: this.issueIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }
    )
    console.log(`Subscribe to the Issue chatroom with the id ${this.issueIdValue}.`)
  }

  disconnect() {
    console.log(`Unsubscribe from the Issue chatroom with the id ${this.issueIdValue}.`);
    this.channel.unsubscribe()
  }

  resetForm(event) {
    event.target.reset()
  }

  #insertMessageAndScrollDown(data) {

    this.messagesTarget.insertAdjacentHTML("beforeend", data);
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight);
    console.log(`testing`)
  }
}

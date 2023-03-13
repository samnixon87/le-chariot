import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// const Pinned = document.getElementById('Pinned');
// const pinColor = document.getElementById('pinColor');
// // Add an event listener to the button element
// Pinned.addEventListener('click', function() {
//   pinColor.style.backgroundColor = 'blue';
// });


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
    this.messagesTarget.parentElement.parentElement.scrollTo(0, this.messagesTarget.parentElement.parentElement.scrollHeight);
    console.log(`testing`)
  }
}

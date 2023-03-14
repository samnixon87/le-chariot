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
  static targets = ["messages", "form", "empty"]

  connect() {
    console.log(this.element);
    this.channel = createConsumer().subscriptions.create(
      { channel: "IssueChannel", id: this.issueIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }
    )
    console.log(`Subscribe to the Issue chatroom with the id ${this.issueIdValue}.`)
    console.log(this.formTarget)

  }

  disconnect() {
    console.log(`Unsubscribe from the Issue chatroom with the id ${this.issueIdValue}.`);
    this.channel.unsubscribe()
  }

  validateForm(event) {
    if (document.getElementById("message_content_trix_input_message").value == "") {
      console.log("Don't Submit")
      event.detail.formSubmission.stop()
      console.dir(event.detail.formSubmission)
    }
  }

  resetForm(event) {
    event.target.reset()
  }

  #insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data);
    if (this.hasEmptyTarget) {
      this.emptyTarget.outerHTML = "";
    }
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight);
  }
}

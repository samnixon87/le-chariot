import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="channel-subscription"
export default class extends Controller {
  static values = { channelId: Number }
  static targets = ["messages"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChannelChannel", id: this.channelIdValue },
      { received: data => this.messagesTarget.insertAdjacentHTML("beforeend", data) }
    )
    console.log(`Subscribe to the chatroom with the id ${this.channelIdValue}.`)
  }

}

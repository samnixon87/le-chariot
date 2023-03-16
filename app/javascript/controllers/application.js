import { Application } from "@hotwired/stimulus"
const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

import { Confetti } from "stimulus-confetti"
application.register('confetti', Confetti)

import { Controller } from "@hotwired/stimulus"
import hljs from 'highlightjs';

// Connects to data-controller="highlight"
export default class extends Controller {
  connect() {
    console.log(this.element)
    hljs.highlightBlock(this.element)
  }
}

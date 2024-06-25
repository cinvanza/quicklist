import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-email"
export default class extends Controller {
  ["form", "input", "results"]


  connect() {
    console.log(this.formTarget)
  }


  update(event) {
    event.preventDefault();
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data
      })
  }
}

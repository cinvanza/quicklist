// app/javascript/controllers/search_product_controller.js
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["input", "data"]

  update() {
    const query = this.inputTarget.value
    const url = this.element.action

    fetch(url, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Accept": "text/html"
      },
      body: JSON.stringify({ product: { name: query } })
    })
    .then(response => {
      if (!response.ok) {
        throw new Error("Network response was not ok")
      }
      return response.text()
    })
    .then(html => {
      this.updateResults(html)
    })
    .catch(error => {
      console.error("There was a problem with your fetch operation:", error)
    })
  }

  updateResults(html) {
    this.dataTarget.innerHTML = html
  }
}

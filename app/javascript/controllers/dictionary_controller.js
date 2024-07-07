import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  static targets = ['input', 'data']
  connect() {
    console.log(this.inputTarget);
  }
  update() {
    const input = this.inputTarget; // Define the input variable
    const ul = this.dataTarget; // Assuming the ul is referenced by dataTarget
    fetch(`https://dictionary.lewagon.com/autocomplete/${input.value}`)
      .then(response => response.json())
      .then((data) => {
        console.log(data)
        // Clear previous list items
        ul.innerHTML = '';
        // Insert new list items
        data['words'].forEach((i) => {
          ul.insertAdjacentHTML("beforeend", `<li data-action='click->dictionary#insertword'>${i}</li>`);
        });
      });
  }
  insertword(event) {
    this.inputTarget.value = event.target.innerText;
    this.dataTarget.innerHTML = '';
  }
}

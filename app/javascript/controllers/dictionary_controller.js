import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['input', 'data']
  connect() {console.log(this.formTarget)

  }



  update() {
    fetch(`https://wagon-dictionary.herokuapp.com/autocomplete/${input.value}`)
    .then(response => response.json())
    .then((data) => {
     // console.log(data['words']);
     data['words'].forEach((i) => {
       ul.insertAdjacentHTML("beforeend",`<li>${i}</li>`);

     })
   });
}





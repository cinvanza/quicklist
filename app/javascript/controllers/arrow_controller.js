import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("Arrow controller connected");
  }

  scrollDown() {
    window.scrollBy({
      top: window.innerHeight,
      behavior: "smooth"
    });
  }
}

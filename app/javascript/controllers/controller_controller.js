import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["icon"];

  connect() {
    this.updateIcon();
  }

  updateIcon() {
    const iconType = this.data.get("icon");
    if (iconType) {
      this.iconTarget.className = `fa-solid fa-${iconType} list-icon`;
    }
  }
}

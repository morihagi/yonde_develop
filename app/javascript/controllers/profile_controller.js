import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="profile-form"
export default class extends Controller {
  static targets = ["profileForm", "check"];

  clear() {
    this.toggleProfileForm.reset();
  }

  toggleProfileForm() {
    if (this.checkTarget.checked) {
      this.profileFormTarget.style.display = "block";
    } else {
      this.profileFormTarget.style.display = "none";
    }
  }
}

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="profile-form"
export default class extends Controller {
  static targets = [ "zipCode", "prefecture", "city", "otherAddress", "phone", "check" ];

  connect() {
    this.checkAndFillFields();
  }

  toggle() {
    this.checkAndFillFields();
  }
  
  checkAndFillFields() {
    if (this.checkTarget.checked) {
      this.zipCodeTarget.value = this.zipCodeTarget.dataset.profileFormDefault;
      this.prefectureTarget.value = this.prefectureTarget.dataset.profileFormDefault;
    } else {
      this.zipCodeTarget.value = '';
      this.prefectureTarget.value = '';
    }
  }
}

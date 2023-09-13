import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="mail"
export default class extends Controller {
  static targets = ["statusMessage"];

  sendMail() {
    const postId = this.data.get("postId");

    fetch(`/posts/${postId}/status`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        status: "sent"
      })
    })
      .then(response => {
        if (response.ok) {
          // Success: update the status message
          this.statusMessageTarget.textContent = "Status changed to send";
        } else {
          // Error: handle the error
          console.error("Failed to change status");
        }
      })
      .catch(error => {
        // Error: handle the error
        console.error("Failed to change status", error);
      });
  }
}

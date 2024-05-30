import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="position"
export default class extends Controller {

  static targets = ["lat", "long"]

  connect() {
    this.getLocation();
  }

  getLocation() {
    navigator.geolocation.getCurrentPosition((position) => {
      this.latTarget.value = position.coords.latitude;
      this.longTarget.value = position.coords.longitude;
    })
  }
}

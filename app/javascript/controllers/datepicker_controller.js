import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

// Connects to data-controller="datepicker"
export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      defaultDate: "today", // Set the default date (optional)
      minDate: "today", // Set the minimum date (mindate)
      maxDate: "2024-12-31", // Set the maximum date (optional)
      // Other options can be added here
    })
  }
}

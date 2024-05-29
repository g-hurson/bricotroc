import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

// Connects to data-controller="datepicker"
export default class extends Controller {
  connect() {
    const fpConf = {defaultDate: "today", minDate: "today"}
    flatpickr(this.element, fpConf)
  }
}

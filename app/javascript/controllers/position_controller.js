import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="position"
export default class extends Controller {

  static targets = ["lat", "long", "toolPos"]

  connect() {
    this.getLocation();
    //this.toolPosTargets.forEach((tool) => { tool.innerText = "ZOB" });
  }

  getLocation() {
    navigator.geolocation.getCurrentPosition((position) => {
      if( this.latTarget !== null){
        this.latTarget.value = position.coords.latitude;
        this.longTarget.value = position.coords.longitude;
      }
      if( this.toolPosTargets !== null){
        this.toolPosTargets.forEach((tool) => {
          console.log(tool);
          const toolLat = tool.querySelector("#toolLat").value;
          const toolLong = tool.querySelector("#toolLong").value;
          console.log(`\n\n PUTAIN DE COOORDONNEES ${toolLat} | ${toolLong}`);
          tool.innerText = `${this.distanceInKmBetweenEarthCoordinates(position.coords.latitude, position.coords.longitude, toolLat, toolLong).toFixed(2)}km`;
        });
      }
    })
  }

  degreesToRadians(degrees) {
    return degrees * Math.PI / 180;
  }

  distanceInKmBetweenEarthCoordinates(lat1, lon1, lat2, lon2) {
    var earthRadiusKm = 6371;

    var dLat = this.degreesToRadians(lat2-lat1);
    var dLon = this.degreesToRadians(lon2-lon1);

    lat1 = this.degreesToRadians(lat1);
    lat2 = this.degreesToRadians(lat2);

    var a = Math.sin(dLat/2) * Math.sin(dLat/2) +
            Math.sin(dLon/2) * Math.sin(dLon/2) * Math.cos(lat1) * Math.cos(lat2);
    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
    return earthRadiusKm * c;
  }
}

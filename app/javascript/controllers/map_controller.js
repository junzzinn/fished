import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.initMap();
  }

  initMap() {
    const initialLatLngString = this.data.get("initialLatlng");
    const initialLatLng = JSON.parse(initialLatLngString);

    const mapOptions = {
      center: initialLatLng,
      zoom: 2
    };

    const map = L.map(this.element).setView(initialLatLng, 2);

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {}).addTo(map);
  }
}

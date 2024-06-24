import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["icon"];

  connect() {
    const activeTab = localStorage.getItem("activeTab");
    if (activeTab) {
      this.setActiveIcon(activeTab);
    }
  }

  toggle(event) {
    const clickedTab = event.currentTarget.dataset.tab;
    localStorage.setItem("activeTab", clickedTab);
    this.setActiveIcon(clickedTab);
  }

  setActiveIcon(activeTab) {
    this.iconTargets.forEach(icon => {
      const iconTab = icon.dataset.tab;
      if (activeTab === iconTab) {
        icon.classList.add("fas");
        icon.classList.remove("far");
        icon.parentElement.classList.add("active");
        if (iconTab === "home") {
          icon.classList.remove("fas");
          icon.classList.remove("bi-house-door");
          icon.classList.add("bi-house-door-fill");
        }
        if (iconTab === "search") {
          icon.classList.remove("fa-search");
          icon.classList.add("fa-magnifying-glass-location");
        }
      } else if (iconTab === "search") {
        icon.parentElement.classList.remove("active");
        icon.classList.remove("fa-magnifying-glass-location");
        icon.classList.add("fa-search");
      } else if (iconTab === "home") {
        icon.parentElement.classList.remove("active");
        icon.classList.remove("bi-house-door-fill");
        icon.classList.add("bi-house-door");
      } else {
        icon.parentElement.classList.remove("active");
        icon.classList.remove("fas");
        icon.classList.add("far");
      }
    });
  }
}

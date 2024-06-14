import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="forecast"
export default class extends Controller {
  static targets = ["currentWeatherIcon", "temperature", "cityName"]
  connect() {
    const city = this.cityNameTarget.innerText
    this.fetchWeatherData(city)
  }
    fetchWeatherData(cityName) {
      const apiKey = '0094fecf3c7b435fb3e134817240806';
      const apiUrl = `https://api.weatherapi.com/v1/current.json?key=${apiKey}&q=${cityName}`;

      fetch(apiUrl)
      .then(response => {
        if (response.ok){
        return response.json()}})

      .then(data => {
        console.log(data)
        if (data.error == undefined){
          console.log(this.temperatureTarget)
          const currentTemperature = data.current.temp_c;
          this.temperatureTarget.textContent = `${currentTemperature}°C`;
          this.cityNameTarget.textContent = cityName;

          const currentWeatherIcon = this.currentWeatherIconTarget;
          const currentWeatherCode = data.current.condition.code;
          if (currentWeatherCode === 1000) {
            currentWeatherIcon.src = 'https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-weather/sun.svg';
          } else if (currentWeatherCode >= 1003 && currentWeatherCode <= 1009) {
            currentWeatherIcon.src = 'https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-weather/clouds.svg';
          } else if (currentWeatherCode >= 1063 && currentWeatherCode <= 1189) {
            currentWeatherIcon.src = 'https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-weather/rain.svg';
          } else {
            currentWeatherIcon.src = 'https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-weather/other.svg';
          }
          
          const forecastHours = [7, 12, 18, 22];
              for (let i = 0; i < forecastHours.length; i++) {
                  const forecastTemperature = data.forecast.forecastday[0].hour.find(hour => (new Date(hour.time)).getHours() === forecastHours[i]).temp_c;
                  const forecastWeatherCode = data.forecast.forecastday[0].hour.find(hour => (new Date(hour.time)).getHours() === forecastHours[i]).condition.code;
                  const forecastIconElement = document.getElementById(`forecast-${i + 1}`).querySelector('i');
                  if (forecastWeatherCode === 1000) {
                      forecastIconElement.classList.add('fa-sun');
                  } else if (forecastWeatherCode >= 1003 && forecastWeatherCode <= 1009) {
                      forecastIconElement.classList.add('fa-cloud');
                  } else if (forecastWeatherCode >= 1063 && forecastWeatherCode <= 1189) {
                      forecastIconElement.classList.add('fa-cloud-showers-heavy');
                  } else {
                      forecastIconElement.classList.add('fa-question');
                  }
                  const time = forecastHours[i] > 12 ? forecastHours[i] - 12 + ' PM' : forecastHours[i] + ' AM';
                  document.getElementById(`forecast-${i + 1}`).querySelector('p:nth-child(3)').innerHTML = `<strong>${time}</strong>`;
                  document.getElementById(`forecast-${i + 1}`).querySelector('p:first-child').innerHTML = `<strong>${forecastTemperature}°C</strong>`;
              }
        }
      })
      .catch(error => console.log('Error fetching weather data:', error));
    }

}

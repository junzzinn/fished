import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["currentWeatherIcon", "temperature", "cityName"];

  connect() {
    const cityName = this.cityNameTarget.textContent.trim();
    this.fetchWeatherData(cityName);
  }

  fetchWeatherData(cityName) {
    const apiKey = '0094fecf3c7b435fb3e134817240806';
    const apiUrl = `https://api.weatherapi.com/v1/forecast.json?key=${apiKey}&q=${cityName}&days=4`;

    fetch(apiUrl)
      .then(response => {
        if (response.ok) {
          return response.json();
        } else {
          throw new Error('Erro ao buscar dados de previsão do tempo.');
        }
      })
      .then(data => {
        console.log(data);
        if (!data.error) {
          // Atualizar temperatura atual
          const currentTemperature = data.current.temp_c;
          this.temperatureTarget.textContent = `${currentTemperature}°C`;

          // Atualizar ícone do tempo atual
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

          // Atualizar previsão do tempo para os próximos dias
          const forecasts = data.forecast.forecastday.slice(1, 5); // Pegar os próximos 4 dias
          const daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

          forecasts.forEach((forecast, index) => {
            const forecastElement = this.element.querySelector(`#forecast-${index + 1}`);
            const dayOfWeek = daysOfWeek[new Date(forecast.date).getDay()];
            forecastElement.querySelector('p:nth-of-type(1)').textContent = `${forecast.day.avgtemp_c}°C`;
            // Define o ícone baseado no código do tempo
            if (forecast.day.condition.code === 1000) {
              forecastElement.querySelector('i').className = 'fas fa-sun fa-2x my-1';
            } else if (forecast.day.condition.code >= 1003 && forecast.day.condition.code <= 1009) {
              forecastElement.querySelector('i').className = 'fas fa-cloud fa-2x my-1';
            } else if (forecast.day.condition.code >= 1063 && forecast.day.condition.code <= 1189) {
              forecastElement.querySelector('i').className = 'fas fa-cloud-showers-heavy fa-2x my-1';
            } else {
              forecastElement.querySelector('i').className = 'fas fa-cloud fa-2x my-1';
            }
            forecastElement.querySelector('p:nth-of-type(2)').textContent = dayOfWeek;
          });
        } else {
          throw new Error('Erro ao buscar dados de previsão do tempo.');
        }
      })
      .catch(error => console.error('Erro ao buscar dados de previsão do tempo:', error));
  }
}

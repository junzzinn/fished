  function fetchWeatherData() {
    const apiKey = 'YOUR_API_KEY';
    const apiUrl = `https://api.weatherapi.com/v1/forecast.json?key=${apiKey}&q=Coimbra&days=5`;

    fetch(apiUrl)
      .then(response => response.json())
      .then(data => {
        const currentTemperature = data.current.temp_c;
        const cityName = data.location.name;
        document.getElementById('current-temperature').textContent = `${currentTemperature}°C`;
        document.getElementById('city-name').textContent = cityName;

        const forecastDays = data.forecast.forecastday;
        forecastDays.forEach((day, index) => {
          const forecastTemperature = day.day.avgtemp_c;
          document.getElementById(`forecast-temperature-${index}`).textContent = `${forecastTemperature}°C`;
        });
      })
      .catch(error => console.error('Error fetching weather data:', error));
  }


  fetchWeatherData();

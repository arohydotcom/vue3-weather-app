<template>
  <div class="app">
    <h1>Weather App</h1>
    <div class="search"><input v-model="city" placeholder="Search city..." @keyup.enter="search"><button @click="search">Search</button></div>
    <div v-if="weather" class="weather"><div class="temp">{{ weather.temp }}C</div><div>{{ weather.desc }}</div><div class="details"><span>Humidity: {{ weather.humidity }}%</span><span>Wind: {{ weather.wind }} km/h</span></div></div>
    <div class="forecast"><h3>5-Day Forecast</h3><div class="days"><div v-for="d in forecast" :key="d.day" class="day"><div>{{ d.day }}</div><div>{{ d.icon }}</div><div>{{ d.temp }}C</div></div></div></div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      city: '',
      weather: { temp: 22, desc: 'Partly Cloudy', humidity: 55, wind: 12 },
      forecast: [
        { day: 'Mon', icon: 'Sunny', temp: 24 },
        { day: 'Tue', icon: 'Cloudy', temp: 22 },
        { day: 'Wed', icon: 'Rain', temp: 18 },
        { day: 'Thu', icon: 'Cloudy', temp: 20 },
        { day: 'Fri', icon: 'Sunny', temp: 26 },
      ],
    };
  },
  methods: {
    search() {
      if (!this.city) return;
      this.weather = { temp: 18 + Math.floor(Math.random() * 12), desc: 'Partly Cloudy', humidity: 45 + Math.floor(Math.random() * 30), wind: 5 + Math.floor(Math.random() * 20) };
    },
  },
};
</script>
<style scoped>
.app { max-width: 600px; margin: 0 auto; padding: 2rem; font-family: system-ui, sans-serif; }
.search { display: flex; gap: .5rem; margin: 1.5rem 0; }
.search input { flex: 1; padding: .75rem; border: 1px solid #ddd; border-radius: 8px; }
.search button { padding: .75rem 1.5rem; background: #3b82f6; color: white; border: none; border-radius: 8px; cursor: pointer; }
.temp { font-size: 4rem; font-weight: 700; }
.details { display: flex; gap: 2rem; color: #666; }
.days { display: flex; justify-content: space-around; margin-top: 1rem; }
.day { text-align: center; font-size: 1.5rem; }
</style>
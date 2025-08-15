# WeatherFlow Tempest Plugin for Q-SYS

The **WeatherFlow Tempest** plugin enables Q-SYS systems to receive and utilize real-time weather data from WeatherFlow Tempest weather stations. The plugin supports both the WeatherFlow UDP and WebSocket APIs for flexible integration.

## Features

- **Dual API Support**: Connect to your Tempest station using either the local UDP API or the remote WebSocket API.
- **Live Weather Data**: Stream real-time temperature, humidity, wind, rainfall, and other sensor data directly into Q-SYS.
- **Event Triggers**: Use weather events (e.g., rain start, high wind) to trigger Q-SYS control logic or presets.
- **Simple Configuration**: Easy setup through the Q-SYS Designer plugin properties.

## Basic Operation

1. **Installation**

- Import the plugin into Q-SYS Designer and add it to your design.

2. **Configuration**

- Choose your preferred API (UDP for local, WebSocket for remote/cloud).
- Enter your WeatherFlow Tempest station details and, if using WebSocket, your API token.
- Assign Q-SYS controls or logic to desired weather data points or events.
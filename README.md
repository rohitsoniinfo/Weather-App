# Simple Weather App

## Description
The Simple Weather App is a user-friendly mobile application built using the Flutter framework and Dart programming language. It provides weather information for a city, current location, and offers customized weather icons along with helpful recommendations based on the weather conditions.

## Features
- **City Weather**: Get up-to-date weather information for any city around the world.

- **Location-based Weather**: Obtain weather details for your current location instantly.

- **Customized Weather Icons**: Enjoy visually appealing weather icons that represent different weather conditions.

- **Weather Recommendations**: Receive personalized suggestions on what to do based on the current weather conditions.

## Installation
To use the Simple Weather App, follow these steps:

1. Clone the repository to your local machine or download the latest release.

   ```bash
   git clone https://github.com/rohitsoniinfo/WifiHackingScript.git

## Usage

### Searching for City Weather
1. Enter the name of the city for which you want to check the weather in the input field.
2. Click the "Search" button.
3. The weather information for the specified city will be displayed.

### Location-based Weather
1. Click the "Use My Location" button.
2. Allow location access if prompted.
3. The weather information for your current location will be displayed.

### Customized Weather Icons
The app uses customized weather icons that visually represent different weather conditions. These icons make it easy to understand the current weather at a glance.

### Weather Recommendations
Based on the current weather conditions, the app provides recommendations on what you can do. For example, if it's sunny, you might receive a suggestion to go for a walk, while on a rainy day, you might be advised to stay indoors and read a book.

### Technologies Used
The Simple Weather App is built using the following technologies:

- Flutter
- Dart
- OpenWeatherMap API (for weather data)

### API Key
To fetch weather data, the app uses the OpenWeatherMap API. You'll need to obtain your API key from [OpenWeatherMap](https://openweathermap.org/api) and replace the placeholder `YOUR_API_KEY` in the `lib/api/weather_api.dart` file with your actual API key.

```dart
const apiKey = 'YOUR_API_KEY';


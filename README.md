# Project Title
[WeatherApp]

# Project Description
WeatherApp is an iOS application that provides real-time weather information and 5-day forecasts for various locations. Built using Swift and the MVVM architecture, it integrates with WeatherAPI to provide accurate and up-to-date weather data.

## Table of Contents
* Features
* Requirements
* How to Use
* API Reference
* Installation
* Tech Stack
* Running Tests
* Screenshots/Demo


## Features
* **Real-Time Weather**:Displays current temperature, wind speed, humidity, and other key weather details for the selected location.
* **5-Day Forecast**:Provides extended weather forecasts for the next five days with temperature and weather conditions.
* **City Search**:Allows users to search weather data by entering a city name, making it easy to find weather information for any location.
* **Unit Testing**:Includes unit tests for services, ensuring stability and correctness of the app.
  

## Requirements
* Xcode 16.3 or later
* Swift 5 or later
* Network connectivity is needed to fetch weather data.
  

## How to Use
* **Open the app**:Launch the WeatherApp on your iOS device or simulator.
* **Tap on the search bar**:Once the app is open, you’ll see a search bar at the top of the screen.
* **Type the city name**:Tap the search bar and enter the name of the city for which you want to get the weather information.
* **Search**:After typing the city name, press "Search" on the keyboard to fetch the weather data for that city.
* **View weather details**:The app will display the current weather information (temperature, wind speed, humidity, etc.) for the selected city, along with a 5-day weather forecast.


## API Reference

#### Get Weather Data

```http
  GET api.weatherapi.com/v1/forecast.json
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `key`     | `string` | **Required**.  API key.    |
| `city`    | `string` | **Required**. city name    |
| `days`    | `Int`    | **Required**. Number of days |

# Link : 
https://www.weatherapi.com/api-explorer.aspx

## Installation

```bash
1. Clone the repository:git clone https://github.com/shipra03nagarro/weather-app.git
2. Open the project in Xcode:
    * Navigate to the project directory and open WeatherApp.xcodeproj or WeatherApp.xcworkspace.
3. Install dependencies (if any):
    * If your project uses CocoaPods, run:pod install
    * If your project uses Swift Package Manager, dependencies should be installed automatically.
4. Build and run the project:
    * Select the target device (simulator or physical device) and click the Run button in Xcode.
```
    
## Tech Stack

* Swift:The app is built using Swift for a clean, modern codebase.
* MVVM Architecture:The app follows the Model-View-ViewModel architecture to separate concerns and enhance maintainability.
* Unit Testing:Uses Xcode’s built-in testing framework to ensure the app's functionality is correct and stable.
## Running Tests

```bash
Open the Test Navigator:
Press Cmd + 5 or select View > Navigators > Show Test Navigator from the top Xcode menu.

Locate WeatherServiceTests:
In the Test Navigator panel, you should see a list of your tests. Find WeatherServiceTests (or the name you gave your test file).

Run the Tests:
Click the Run button (the green triangle) next to WeatherServiceTests to run all the tests in that class.

If you only want to run a specific test, you can click the Run button next to that individual test method (e.g., testFetchWeatherReport_success).
```


## Screenshots
![Simulator Screenshot - iPhone 16 Pro - 2025-04-09 at 17 39 30](https://github.com/user-attachments/assets/b9f51adc-ec30-450e-8a6c-6c0c3d36d3ff)
![Simulator Screenshot - iPhone 16 Pro - 2025-04-09 at 17 41 01](https://github.com/user-attachments/assets/f7e603f1-d7c9-4517-8e52-cecbc3c3e371)


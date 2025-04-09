//
//  WeatherMockData.swift
//  WeatherAppTests
//
//  Created by Shipra Dhooper on 09/04/25.
//

import Foundation
@testable import WeatherApp

class MockData {
    static func createMockWeatherResponse() -> WeatherResponse {
        return WeatherResponse(
            location: WeatherResponse.Location(
                name: "Gurgaon",
                region: "Haryana",
                country: "India",
                lat: 28.4595,
                lon: 77.0266,
                tzID: "Asia/Kolkata",
                localtimeEpoch: 1619000000,
                localtime: "2021-04-21 12:00:00"
            ),
            current: WeatherResponse.CurrentWeather(
                tempC: 30.0,
                tempF: 86.0,
                isDay: 1,
                windMph: 15.0,
                windKph: 24.1,
                humidity: 70
            ),
            forecast: WeatherResponse.Forecast(forecastDay: [
                WeatherResponse.ForecastDay(date: "2024-04-09", day: WeatherResponse.ForecastDay.Day(
                    maxTempC: 35.0,
                    maxTempF: 95.0,
                    minTempC: 25.0,
                    minTempF: 77.0,
                    avgTempC: 30.0,
                    avgTempF: 86.0,
                    maxWindMph: 15.0,
                    maxWindKph: 24.1,
                    avgHumidity: 70,
                    condition: WeatherResponse.Condition(text: "Sunny")
                )),
                WeatherResponse.ForecastDay(date: "2024-04-10", day: WeatherResponse.ForecastDay.Day(
                    maxTempC: 33.0,
                    maxTempF: 91.4,
                    minTempC: 24.0,
                    minTempF: 75.2,
                    avgTempC: 28.5,
                    avgTempF: 83.3,
                    maxWindMph: 10.0,
                    maxWindKph: 16.1,
                    avgHumidity: 60,
                    condition: WeatherResponse.Condition(text: "Partly Cloudy")
                )),
                WeatherResponse.ForecastDay(date: "2024-04-11", day: WeatherResponse.ForecastDay.Day(
                    maxTempC: 32.0,
                    maxTempF: 89.6,
                    minTempC: 26.0,
                    minTempF: 78.8,
                    avgTempC: 29.0,
                    avgTempF: 84.2,
                    maxWindMph: 12.0,
                    maxWindKph: 19.3,
                    avgHumidity: 65,
                    condition: WeatherResponse.Condition(text: "Cloudy")
                )),
                WeatherResponse.ForecastDay(date: "2024-04-12", day: WeatherResponse.ForecastDay.Day(
                    maxTempC: 34.0,
                    maxTempF: 93.2,
                    minTempC: 27.0,
                    minTempF: 80.6,
                    avgTempC: 30.5,
                    avgTempF: 87.0,
                    maxWindMph: 14.0,
                    maxWindKph: 22.5,
                    avgHumidity: 72,
                    condition: WeatherResponse.Condition(text: "Rainy")
                )),
                WeatherResponse.ForecastDay(date: "2024-04-13", day: WeatherResponse.ForecastDay.Day(
                    maxTempC: 31.0,
                    maxTempF: 87.8,
                    minTempC: 22.0,
                    minTempF: 71.6,
                    avgTempC: 26.5,
                    avgTempF: 79.7,
                    maxWindMph: 16.0,
                    maxWindKph: 25.7,
                    avgHumidity: 68,
                    condition: WeatherResponse.Condition(text: "Sunny")
                ))
            ])
        )
    }
}

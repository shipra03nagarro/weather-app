//
//  WeatherCellConfigurable.swift
//  WeatherApp
//
//  Created by Shipra Dhooper on 09/04/25.
//

protocol WeatherCellConfigurable {
    var dateText: String { get }
    var temperatureText: String { get }
    var windSpeedText: String { get }
    var humidityText: String { get }
    var descriptionText: String { get }
    var iconUrlString: String? { get }
}

extension WeatherResponse.ForecastDay: WeatherCellConfigurable {
    var dateText: String {
        return date
    }

    var temperatureText: String {
        return "Temp: \(day.maxTempC)°C"
    }

    var windSpeedText: String {
        return "Wind: \(day.maxWindKph) kph"
    }

    var humidityText: String {
        return "Humidity: \(day.avgHumidity)%"
    }

    var descriptionText: String {
        return day.condition.text
    }

    var iconUrlString: String? {
        // Construct the full URL for the weather icon
        let baseURL = "https:"
        let iconCode = day.condition.icon
        return baseURL + iconCode
    }
}

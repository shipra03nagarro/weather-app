//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Shipra Dhooper on 08/04/25.
//

import Foundation

struct WeatherResponse: Codable {
    let location: Location
    let current: CurrentWeather
    let forecast: Forecast

    struct Location: Codable {
        let name: String
        let region: String
        let country: String
        let lat: Double
        let lon: Double
        let tzID: String
        let localtimeEpoch: Int
        let localtime: String

        enum CodingKeys: String, CodingKey {
            case name, region, country, lat, lon
            case tzID = "tz_id"
            case localtimeEpoch = "localtime_epoch"
            case localtime
        }
    }

    struct CurrentWeather: Codable {
        let tempC: Double
        let tempF: Double
        let isDay: Int
        let windMph: Double
        let windKph: Double
        let humidity: Int

        enum CodingKeys: String, CodingKey {
            case tempC = "temp_c"
            case tempF = "temp_f"
            case isDay = "is_day"
            case windMph = "wind_mph"
            case windKph = "wind_kph"
            case humidity
        }
    }

    struct Forecast: Codable {
        let forecastDay: [ForecastDay]

        enum CodingKeys: String, CodingKey {
            case forecastDay = "forecastday"
        }
    }

    struct ForecastDay: Codable {
        let date: String
        let day: Day

        struct Day: Codable {
            let maxTempC: Double
            let maxTempF: Double
            let minTempC: Double
            let minTempF: Double
            let avgTempC: Double
            let avgTempF: Double
            let maxWindMph: Double
            let maxWindKph: Double
            let avgHumidity: Int
            let condition: Condition

            enum CodingKeys: String, CodingKey {
                case maxTempC = "maxtemp_c"
                case maxTempF = "maxtemp_f"
                case minTempC = "mintemp_c"
                case minTempF = "mintemp_f"
                case avgTempC = "avgtemp_c"
                case avgTempF = "avgtemp_f"
                case maxWindMph = "maxwind_mph"
                case maxWindKph = "maxwind_kph"
                case avgHumidity = "avghumidity"
                case condition
            }
        }
    }

    struct Condition: Codable {
        let text: String
    }
}

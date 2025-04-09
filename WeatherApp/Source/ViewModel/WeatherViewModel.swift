//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Shipra Dhooper on 08/04/25.
//

import Foundation

protocol WeatherViewDelegate: AnyObject {
    func didReceiveWeatherData()
    func didFailWithError(_ error: APIError)
}

class WeatherViewModel {
    private var forecast: [WeatherResponse.ForecastDay] = []
    weak var delegate: WeatherViewDelegate?
    var apiService: APIServiceProtocol

    init(apiService: APIServiceProtocol = APIService.shared) {
        self.apiService = apiService
    }

    func fetchWeatherReport(for city: String) {
        let request = WeatherRequest(
            baseURL: APPConstant.baseURL,
            parameters: ["q": city, "key": APPConstant.apiKey, "days": 5],
            headers: ["Accept": "application/json"]
        )

        guard request.asURLRequest() != nil else {
            delegate?.didFailWithError(.invalidURL)
            return
        }

        apiService.request(request: request) { [weak self] (result: Result<WeatherResponse, APIError>) in
            switch result {
            case .success(let data):
                self?.forecast = data.forecast.forecastDay
                self?.delegate?.didReceiveWeatherData()
            case .failure(let error):
                self?.delegate?.didFailWithError(error)
            }
        }
    }
}

extension WeatherViewModel {
    func getForecast() -> [WeatherResponse.ForecastDay] {
        return forecast
    }
}

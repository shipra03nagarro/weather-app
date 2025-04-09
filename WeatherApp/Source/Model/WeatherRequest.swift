//
//  WeatherRequest.swift
//  WeatherApp
//
//  Created by Shipra Dhooper on 08/04/25.
//

import Foundation

class WeatherRequest: APIRequest {
    var method: HTTPMethod
    var url: URL?
    var headers: [String: String]?
    var parameters: [String: Any]?

    // MARK: - Initializer
    init(baseURL: String, method: HTTPMethod = .get, parameters: [String: Any]? = nil, headers: [String: String]? = nil) {
        self.method = method
        self.parameters = parameters
        self.headers = headers
        self.url = URL(string: baseURL)
    }

    // MARK: - URL Request
    func asURLRequest() -> URLRequest? {
        guard var url = url else { return nil }

        // Append query parameters if available
        if let parameters = parameters {
            var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
            components?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
            if let updatedURL = components?.url {
                url = updatedURL
            }
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        // Add headers if provided
        if let headers = headers {
            for (key, value) in headers {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }

        return request
    }
}

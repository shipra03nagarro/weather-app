//
//  APIService.swift
//  WeatherApp
//
//  Created by Shipra Dhooper on 08/04/25.
//

import Foundation

protocol APIServiceProtocol {
    func request<T: Decodable>(request: APIRequest, completion: @escaping (Result<T, APIError>) -> Void)
}

// MARK: - HTTP Method Enum
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

// MARK: - API Request Protocol
protocol APIRequest {
    var method: HTTPMethod { get }
    var url: URL? { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }

    func asURLRequest() -> URLRequest?
}

// MARK: - API Error Handling
public enum APIError: Error {
    case invalidURL
    case networkError(String)
    case dataCorrupted
    case decodingError(String)
}

// MARK: - API Service
final class APIService: APIServiceProtocol {
    static let shared = APIService()

    private init() {}

    // MARK: - Generic API Request Method
    func request<T: Decodable>(request: APIRequest, completion: @escaping (Result<T, APIError>) -> Void) {
        guard let urlRequest = request.asURLRequest() else {
            completion(.failure(.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            // Handle network error
            if let error = error {
                completion(.failure(.networkError(error.localizedDescription)))
                return
            }

            // Handle no data or unsuccessful status code
            guard let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(.invalidURL))
                return
            }

            // Log the response data (can be useful for debugging, but avoid in production)
                       if let responseString = String(data: data, encoding: .utf8) {
                           print("Response Body: \(responseString)")
                       } else {
                           print("Failed to convert response data to string.")
                       }

            // Decode the response data
            do {
                let decodedData = try JSONHandler.decode(from: data, as: T.self)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.decodingError(error.localizedDescription)))
            }
        }.resume()
    }
}

//
//  WeatherServiceTest.swift
//  WeatherAppTests
//
//  Created by Shipra Dhooper on 09/04/25.
//

import XCTest
@testable import WeatherApp

class WeatherServiceTest: XCTestCase {
    var sut: WeatherViewModel!
    var mockAPIService: MockAPIService!
    var mockDelegate: MockWeatherViewDelegate!

    override func setUp() {
        super.setUp()
        mockAPIService = MockAPIService()
        mockDelegate = MockWeatherViewDelegate()
        sut = WeatherViewModel(apiService: mockAPIService)
        sut.delegate = mockDelegate
    }

    override func tearDown() {
        sut = nil
        mockAPIService = nil
        mockDelegate = nil
        super.tearDown()
    }

    func testFetchWeatherReport_success() {
        let city = "Gurgaon"
        let expectation = self.expectation(description: "Weather data fetched successfully")

        let weatherResponse = MockData.createMockWeatherResponse()
        mockAPIService.mockResult = .success(weatherResponse)

        sut.fetchWeatherReport(for: city)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertTrue(self.mockDelegate.didReceiveWeatherDataCalled, "Delegate method didReceiveWeatherData should be called.")
            XCTAssertEqual(self.sut.getForecast().count, 5, "Forecast should contain 5 days.") // Fixed count to 5 days
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2)
    }

    func testFetchWeatherReport_failure() {
        let city = "Gurgaon"
        let expectation = self.expectation(description: "Weather data fetch failed")

        mockAPIService.mockResult = .failure(.networkError("Network error"))

        sut.fetchWeatherReport(for: city)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertTrue(self.mockDelegate.didFailWithErrorCalled, "Delegate method didFailWithError should be called.")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2)
    }
}

// Helper classes for mocking APIService and Delegate
class MockAPIService: APIServiceProtocol {
    var mockResult: Result<WeatherResponse, APIError>?

    func request<T>(request: APIRequest, completion: @escaping (Result<T, APIError>) -> Void) where T : Decodable {
        if let result = mockResult as? Result<T, APIError> {
            completion(result)
        } else {
            completion(.failure(.networkError("No mock result set")))
        }
    }
}

class MockWeatherViewDelegate: WeatherViewDelegate {
    var didReceiveWeatherDataCalled = false
    var didFailWithErrorCalled = false

    func didReceiveWeatherData() {
        didReceiveWeatherDataCalled = true
    }

    func didFailWithError(_ error: APIError) {
        didFailWithErrorCalled = true
    }
}

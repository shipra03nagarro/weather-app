//
//  JSONHandler.swift
//  WeatherApp
//
//  Created by Shipra Dhooper on 08/04/25.
//

import Foundation

class JSONHandler {

    // MARK: - Generic Encode & Decode Methods
    static func decode<T: Decodable>(from data: Data, as type: T.Type, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate) throws -> T {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = dateDecodingStrategy
        return try decoder.decode(T.self, from: data)
    }

    static func encode<T: Encodable>(_ object: T, dateEncodingStrategy: JSONEncoder.DateEncodingStrategy = .deferredToDate) throws -> Data {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = dateEncodingStrategy
        return try encoder.encode(object)
    }
}

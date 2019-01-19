//
//  ApiSession.swift
//  YoutubeKit
//
//  Created by Ryo Ishikawa on 12/30/2017
//

import Foundation

public class ApiSession {
    
    public static let shared = ApiSession()
    private init() {}
    
    public func send<T: Requestable>(_ request: T, closure: @escaping (Result<T.Response, Error>) -> Void) {
        
        let task = URLSession.shared.dataTask(with: request.makeURLRequest()) { (data, _, error) in
            
            if let error = error {
                closure(.failed(ResponseError.unexpectedResponse(error)))
                return
            }
            
            do {
                let response = try T.Response.decoded(from: data)
                closure(.success(response))
            } catch let error {
                closure(.failed(error))
            }
        }
        
        task.resume()
    }
}

public extension Decodable {
    static func decoded(from data: Data?) throws -> Self {
        guard let data = data, !data.isEmpty else {
            throw ResponseError.unexpectedResponse("The response data is empty.")
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601WithAndWithoutFS
        
        return try decoder.decode(Self.self, from: data)
    }
}

private extension JSONDecoder.DateDecodingStrategy {
    static let iso8601WithAndWithoutFS = custom { decoder throws -> Date in
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let date = Formatter.iso8601.date(from: string) ?? Formatter.iso8601withFS.date(from: string) {
            return date
        }
        throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid date: \(string)")
    }
}

private extension Formatter {
    static let iso8601 = ISO8601DateFormatter()
    
    static let iso8601withFS: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter
    }()
}

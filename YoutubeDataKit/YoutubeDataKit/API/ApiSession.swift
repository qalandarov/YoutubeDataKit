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
        
        let urlRequest = request.makeURLRequest()
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, rawResponse, error) in
            
            // If the dataTask error is occured.
            if let error = error {
                closure(.failed(ResponseError.unexpectedResponse(error)))
                return
            }
            
            // Decodable must have data length at least.
            guard let data = data else {
                closure(.failed(ResponseError.unexpectedResponse("The response is empty.")))
                return
            }
            
            // Decoding the response from `data` and handle DecodingError if occured.
            do {
                let result = try T.Response.decoded(from: data)
                closure(.success(result))
            } catch let error as DecodingError {
                closure(.failed(error))
            } catch {
                closure(.failed(ResponseError.unexpectedResponse(data)))
            }
        }
        
        task.resume()
    }
}

public extension Decodable {
    static func decoded(from data: Data) throws -> Self {
        return try JSONDecoder().decode(Self.self, from: data)
    }
}

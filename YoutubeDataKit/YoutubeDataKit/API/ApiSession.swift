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
        
        return try JSONDecoder().decode(Self.self, from: data)
    }
}

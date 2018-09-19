//
//  BaseTestCase.swift
//  YoutubeDataKitTests
//
//  Created by Islam Qalandarov on 9/1/18.
//  Copyright © 2018 Qalandarov. All rights reserved.
//

import XCTest

class BaseTestCase: XCTestCase {
    
    func decodeOrFail<T: Decodable>(fileName: String) -> T? {
        guard let decoded = try? T.decoded(from: readJSON(named: fileName)) else {
            XCTFail("Unable to decode the given json file (\(fileName)) to: \(T.self))")
            return nil
        }
        
        return decoded
    }
    
}

private extension BaseTestCase {
    
    func readJSON(named name: String) -> Data? {
        let bundle = Bundle.init(for: type(of: self))
        let ext = "json"
        
        guard let url = bundle.url(forResource: name, withExtension: ext), let data = try? Data(contentsOf: url) else {
            XCTFail("Unable to get the content of the given json file: \(name)")
            return nil
        }
        
        return data
    }
    
}

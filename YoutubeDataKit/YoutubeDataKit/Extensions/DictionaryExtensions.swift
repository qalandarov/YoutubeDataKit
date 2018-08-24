//
//  DictionaryExtensions.swift
//  YoutubeKit
//
//  Created by Ryo Ishikawa on 12/30/2017
//

extension Dictionary where Key == String, Value == Any {
    mutating func appendingQueryParameter(key: String, value: Any?) {
        if let value = value {
            self[key] = value
        }
    }
    
    mutating func appendingQueryParameter<T: RawRepresentable>(key: String, value: T?) where T.RawValue == String {
        if let value = value {
            self[key] = value.rawValue
        }
    }
    
    mutating func appendingQueryFilter(_ filter: QueryParameterable?) {
        if let filterParam = filter?.keyValue {
            self[filterParam.key] = filterParam.value
        }
    }
}

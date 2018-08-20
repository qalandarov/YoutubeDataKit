//
//  YoutubeDataKit.swift
//  YoutubeDataKit
//
//  Created by Islam Qalandarov on 8/20/2017
//

import Foundation

public final class YoutubeDataKit {
    
    public static let shared = YoutubeDataKit()
    public static let youtubeDataAPIVersion = "v3"
    
    private(set) var apiKey: String = ""
    private(set) var accessToken: String = ""
    
    public func setAPIKey(_ key: String) {
        self.apiKey = key
    }
    
    public func setAccessToken(_ token: String) {
        self.accessToken = token
    }
    
    private init() {}
}

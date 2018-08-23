//
//  PlaylistsListRequest.swift
//  YoutubeKit
//
//  Created by Ryo Ishikawa on 12/30/2017
//

import Foundation

/// SeeAlso: https://developers.google.com/youtube/v3/docs/playlists/list
public struct PlaylistsListRequest: Requestable {
    
    public typealias Response = PlaylistsList

    public var path: String {
        return "playlists"
    }
    
    public var httpMethod: HTTPMethod {
        return .get
    }
    
    public var isAuthorizedRequest: Bool {
        switch filter {
        case .channelID(_):
            return false
        case .id(_):
            return false
        case .mine(_):
            return true
        }
    }
    
    public var queryParameters: [String: Any] {
        var query: [String: Any] = [:]
        let part = self.part
            .map { $0.rawValue }
            .joined(separator: ",")
        query.appendingQueryParameter(key: "part", value: part)
        
        let filterParam = filter.keyValue
        query[filterParam.key] = filterParam.value
        
        query.appendingQueryParameter(key: "maxResults", value: maxResults)
        query.appendingQueryParameter(key: "onBehalfOfContentOwner", value: onBehalfOfContentOwner)
        query.appendingQueryParameter(key: "onBehalfOfContentOwnerChannel", value: onBehalfOfContentOwnerChannel)
        query.appendingQueryParameter(key: "pageToken", value: pageToken)
        
        return query
    }
    
    // MARK: - Required parameters
    
    public let part: [Part.PlaylistsList]
    public let filter: Filter.PlaylistsList
    
    // MARK: - Option parameters
    
    public let maxResults: Int?
    public let onBehalfOfContentOwner: String?
    public let onBehalfOfContentOwnerChannel: String?
    public let pageToken: String?
    
    public init(part: [Part.PlaylistsList],
                filter: Filter.PlaylistsList,
                maxResults: Int?,
                onBehalfOfContentOwner: String? = nil,
                onBehalfOfContentOwnerChannel: String? = nil,
                pageToken: String? = nil) {
        self.part = part
        self.filter = filter
        self.maxResults = maxResults
        self.onBehalfOfContentOwner = onBehalfOfContentOwner
        self.onBehalfOfContentOwnerChannel = onBehalfOfContentOwnerChannel
        self.pageToken = pageToken
    }
}

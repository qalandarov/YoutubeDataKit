//
//  PlaylistItemsListRequest.swift
//  YoutubeKit
//
//  Created by Ryo Ishikawa on 12/30/2017
//

import Foundation

/// SeeAlso: https://developers.google.com/youtube/v3/docs/playlistItems/list
public struct PlaylistItemsListRequest: Requestable {
    
    public typealias Response = PlaylistItemsList
    
    public var path: String {
        return "playlistItems"
    }
    
    public var httpMethod: HTTPMethod {
        return .get
    }
    
    public var queryParameters: [String: Any] {
        var query: [String: Any] = ["part": part.toCSV()]
        query.appendingQueryFilter(filter)
        query.appendingQueryParameter(key: "maxResults", value: maxResults)
        query.appendingQueryParameter(key: "pageToken", value: pageToken)
        query.appendingQueryParameter(key: "videoID", value: videoID)
        return query
    }
    
    // MARK: - Required parameters
    
    public let part: [Part.PlaylistItemsList]
    public let filter: Filter.PlaylistItemsList
    
    // MARK: - Option parameters
    
    public let maxResults: Int?
    public let pageToken: String?
    public let videoID: String?
    
    public init(part: [Part.PlaylistItemsList],
                filter: Filter.PlaylistItemsList,
                maxResults: Int?,
                pageToken: String? = nil,
                videoID: String? = nil) {
        self.part = part
        self.filter = filter
        self.maxResults = maxResults
        self.pageToken = pageToken
        self.videoID = videoID
    }
}

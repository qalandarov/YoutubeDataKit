//
//  VideoListRequest.swift
//  YoutubeKit
//
//  Created by Ryo Ishikawa on 12/30/2017
//

/// SeeAlso: https://developers.google.com/youtube/v3/docs/videos/list
public struct VideoListRequest: Requestable {
    
    public typealias Response = VideoList
    
    public var path: String {
        return "videos"
    }
    
    public var httpMethod: HTTPMethod {
        return .get
    }
    
    public var isAuthorizedRequest: Bool {
        switch filter {
        case .chart:
            return false
        case .id:
            return false
        case .myRating:
            return true
        }
    }
    
    public var queryParameters: [String: Any] {
        var query: [String: Any] = ["part": part.toCSV()]
        query.appendingQueryFilter(filter)
        query.appendingQueryParameter(key: "maxResults", value: maxResults)
        query.appendingQueryParameter(key: "onBehalfOfContentOwner", value: onBehalfOfContentOwner)
        query.appendingQueryParameter(key: "pageToken", value: pageToken)
        query.appendingQueryParameter(key: "regionCode", value: regionCode)
        query.appendingQueryParameter(key: "videoCategoryID", value: videoCategoryID)
        return query
    }

    // MARK: - Required parameters
    
    public let part: [Part.VideoList]
    public let filter: Filter.VideoList
    
    // MARK: - Option parameters

    public let maxResults: Int?
    public let onBehalfOfContentOwner: String?
    public let pageToken: String?
    public let regionCode: String?
    public let videoCategoryID: String?
    
    public init(part: [Part.VideoList],
                filter: Filter.VideoList,
                maxResults: Int? = nil,
                onBehalfOfContentOwner: String? = nil,
                pageToken: String? = nil,
                regionCode: String? = nil,
                videoCategoryID: String? = nil) {
        self.part = part
        self.filter = filter
        self.maxResults = maxResults
        self.onBehalfOfContentOwner = onBehalfOfContentOwner
        self.pageToken = pageToken
        self.regionCode = regionCode
        self.videoCategoryID = videoCategoryID
    }
}

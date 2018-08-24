//
//  ActivityRequest.swift
//  YoutubeKit
//
//  Created by Ryo Ishikawa on 12/30/2017
//

/// SeeAlso: https://developers.google.com/youtube/v3/docs/activities/list
public struct ActivityListRequest: Requestable {
    
    public typealias Response = ActivityList

    public var path: String {
        return "activities"
    }
    
    public var httpMethod: HTTPMethod {
        return .get
    }
    
    public var isAuthorizedRequest: Bool {
        switch filter {
        case .channelID:
            return false
        case .home:
            return true
        case .mine:
            return true
        }
    }
    
    public var queryParameters: [String: Any] {
        var query: [String: Any] = ["part": part.toCSV()]
        query.appendingQueryFilter(filter)
        query.appendingQueryParameter(key: "maxResults", value: maxResults)
        query.appendingQueryParameter(key: "pageToken", value: pageToken)
        query.appendingQueryParameter(key: "publishedAfter", value: publishedAfter)
        query.appendingQueryParameter(key: "publishedBefore", value: publishedBefore)
        query.appendingQueryParameter(key: "regionCode", value: regionCode)
        return query
    }
    
    // MARK: - Required parameters

    public let part: [Part.ActivityList]
    public let filter: Filter.ActivityList
    
    // MARK: - Option parameters

    public let maxResults: Int?
    public let pageToken: String?
    public let publishedAfter: Date?
    public let publishedBefore: Date?
    public let regionCode: String?

    public init(part: [Part.ActivityList],
                filter: Filter.ActivityList,
                maxResults: Int? = nil,
                pageToken: String? = nil,
                publishedAfter: Date? = nil,
                publishedBefore: Date? = nil,
                regionCode: String? = nil) {
        self.part = part
        self.filter = filter
        self.maxResults = maxResults
        self.pageToken = pageToken
        self.publishedAfter = publishedAfter
        self.publishedBefore = publishedBefore
        self.regionCode = regionCode
    }
}

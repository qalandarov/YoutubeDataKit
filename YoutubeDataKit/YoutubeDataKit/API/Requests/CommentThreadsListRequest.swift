//
//  CommentThreadsListRequest.swift
//  YoutubeKit
//
//  Created by Ryo Ishikawa on 12/30/2017
//

import Foundation

/// SeeAlso: https://developers.google.com/youtube/v3/docs/commentThreads/list
public struct CommentThreadsListRequest: Requestable {
    
    public typealias Response = CommentThreadsList
    
    public var path: String {
        return "commentThreads"
    }
    
    public var httpMethod: HTTPMethod {
        return .get
    }
    
    public var queryParameters: [String: Any] {
        var query: [String: Any] = ["part": part.toCSV()]
        query.appendingQueryFilter(filter)
        query.appendingQueryParameter(key: "maxResults", value: maxResults)
        query.appendingQueryParameter(key: "moderationStatus", value: moderationStatus)
        query.appendingQueryParameter(key: "order", value: order)
        query.appendingQueryParameter(key: "pageToken", value: pageToken)
        query.appendingQueryParameter(key: "searchTerms", value: searchTerms)
        query.appendingQueryParameter(key: "textFormat", value: textFormat)
        return query
    }
    
    // MARK: - Required parameters
    
    public let part: [Part.CommentThreadsList]
    public let filter: Filter.CommentThreadsList
    
    // MARK: - Option parameters
    
    public let maxResults: Int?
    public let moderationStatus: CommentModerationStatus?
    public let order: ResultOrder.CommentThreads?
    public let pageToken: String?
    public let searchTerms: String?
    public let textFormat: CommentTextFormat?
    
    public init(part: [Part.CommentThreadsList],
                filter: Filter.CommentThreadsList,
                maxResults: Int?,
                moderationStatus: CommentModerationStatus? = nil,
                order: ResultOrder.CommentThreads? = nil,
                pageToken: String? = nil,
                searchTerms: String? = nil,
                textFormat: CommentTextFormat? = nil) {
        self.part = part
        self.filter = filter
        self.maxResults = maxResults
        self.moderationStatus = moderationStatus
        self.order = order
        self.pageToken = pageToken
        self.searchTerms = searchTerms
        self.textFormat = textFormat
    }
}

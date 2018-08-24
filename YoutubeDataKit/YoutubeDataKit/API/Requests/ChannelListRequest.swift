//
//  ChannelListRequest.swift
//  YoutubeKit
//
//  Created by Ryo Ishikawa on 12/30/2017
//

import Foundation

/// SeeAlso: https://developers.google.com/youtube/v3/docs/channels/list
public struct ChannelListRequest: Requestable {
    
    public typealias Response = ChannelList

    public var path: String {
        return "channels"
    }
    
    public var httpMethod: HTTPMethod {
        return .get
    }
    
    public var isAuthorizedRequest: Bool {
        switch filter {
        case .categoryID:
            return false
        case .id:
            return false
        case .managedByMe:
            return true
        case .mine:
            return true
        case .userName:
            return false
        }
    }
    
    public var queryParameters: [String: Any] {
        var query: [String: Any] = ["part": part.toCSV()]
        query.appendingQueryFilter(filter)
        query.appendingQueryParameter(key: "maxResult", value: maxResult)
        query.appendingQueryParameter(key: "onBehalfOfContentOwner", value: onBehalfOfContentOwner)
        query.appendingQueryParameter(key: "pageToken", value: pageToken)
        return query
    }

    // MARK: - Required parameters
    
    public let part: [Part.ChannelList]
    public let filter: Filter.ChannelList
    
    // MARK: - Option parameters
    
    public let maxResult: Int?
    public let onBehalfOfContentOwner: String?
    public let pageToken: String?
    
    public init(part: [Part.ChannelList],
                filter: Filter.ChannelList,
                maxResult: Int? = nil,
                onBehalfOfContentOwner: String? = nil,
                pageToken: String? = nil) {
        self.part = part
        self.filter = filter
        self.maxResult = maxResult
        self.onBehalfOfContentOwner = onBehalfOfContentOwner
        self.pageToken = pageToken
    }
}

//
//  SubscriptionsListRequest.swift
//  YoutubeKit
//
//  Created by Ryo Ishikawa on 12/30/2017
//

import Foundation

/// SeeAlso: https://developers.google.com/youtube/v3/docs/subscriptions/list
public struct SubscriptionsListRequest: Requestable {
    
    public typealias Response = SubsucriptionsList

    public var path: String {
        return "subscriptions"
    }
    
    public var httpMethod: HTTPMethod {
        return .get
    }
    
    public var isAuthorizedRequest: Bool {
        switch filter {
        case .channelID:
            return false
        case .id:
            return false
        case .mine:
            return true
        case .mySubscriptions:
            return true
        }
    }
    
    public var queryParameters: [String: Any] {
        var query: [String: Any] = ["part": part.toCSV()]
        query.appendingQueryFilter(filter)
        query.appendingQueryParameter(key: "channelId", value: forChannelID)
        query.appendingQueryParameter(key: "maxResults", value: maxResults)
        query.appendingQueryParameter(key: "onBehalfOfContentOwner", value: onBehalfOfContentOwner)
        query.appendingQueryParameter(key: "onBehalfOfContentOwnerChannel", value: onBehalfOfContentOwnerChannel)
        query.appendingQueryParameter(key: "order", value: order)
        query.appendingQueryParameter(key: "pageToken", value: pageToken)
        return query
    }
    
    // MARK: - Required parameters
    
    public let part: [Part.SubscriptionsList]
    public let filter: Filter.SubscriptionsList
    
    // MARK: - Option parameters
    
    public let forChannelID: String?
    public let maxResults: Int?
    public let onBehalfOfContentOwner: String?
    public let onBehalfOfContentOwnerChannel: String?
    public let order: ResultOrder.Subscriptions?
    public let pageToken: String?
    
    public init(part: [Part.SubscriptionsList],
                filter: Filter.SubscriptionsList,
                forChannelID: String? = nil,
                maxResults: Int? = nil,
                onBehalfOfContentOwner: String? = nil,
                onBehalfOfContentOwnerChannel: String? = nil,
                order: ResultOrder.Subscriptions? = nil,
                pageToken: String? = nil) {
        self.part = part
        self.filter = filter
        self.forChannelID = forChannelID
        self.maxResults = maxResults
        self.onBehalfOfContentOwner = onBehalfOfContentOwner
        self.onBehalfOfContentOwnerChannel = onBehalfOfContentOwnerChannel
        self.order = order
        self.pageToken = pageToken
    }
}

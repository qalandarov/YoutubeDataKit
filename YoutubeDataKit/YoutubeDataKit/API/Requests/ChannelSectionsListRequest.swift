//
//  ChannelSectionsListRequest.swift
//  YoutubeKit
//
//  Created by Ryo Ishikawa on 12/30/2017
//

import Foundation

/// SeeAlso: https://developers.google.com/youtube/v3/docs/channelSections/list
public struct ChannelSectionsListRequest: Requestable {
    
    public typealias Response = ChannelSectionsList

    public var path: String {
        return "channelSections"
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
        }
    }
    
    public var queryParameters: [String: Any] {
        var query: [String: Any] = ["part": part.toCSV()]
        query.appendingQueryFilter(filter)
        query.appendingQueryParameter(key: "hl", value: hl)
        query.appendingQueryParameter(key: "onBehalfOfContentOwner", value: onBehalfOfContentOwner)
        return query
    }

    // MARK: - Required parameters
    
    public let part: [Part.ChannelSectionsList]
    public let filter: Filter.ChannelSectionsList
    
    // MARK: - Option parameters
    
    public let hl: String?
    public let onBehalfOfContentOwner: String?
    
    public init(part: [Part.ChannelSectionsList],
                filter: Filter.ChannelSectionsList,
                hl: String? = nil,
                onBehalfOfContentOwner: String? = nil) {
        self.part = part
        self.filter = filter
        self.hl = hl
        self.onBehalfOfContentOwner = onBehalfOfContentOwner
    }
}

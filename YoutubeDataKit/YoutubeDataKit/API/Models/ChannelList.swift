//
//  ChannelList.swift
//  YoutubeKit
//
//  Created by Ryo Ishikawa on 12/30/2017
//

import Foundation

public struct ChannelList: Codable {
    public let etag: String
    public let items: [Channel]
    public let kind: String
    public let pageInfo: PageInfo
    public let nextPageToken: String?
    public let prevPageToken: String?
}

public struct Channel: Codable {
    public let brandingSettings: BrandingSettings?
    public let contentDetails: ContentDetails.ChannelList?
    public let etag: String
    public let id: String
    public let kind: String
    public let snippet: Snippet.ChannelList?
    public let statistics: Statistics.ChannelList?
    public let topicDetails: TopicDetails?
}

public struct TopicDetails: Codable {
    public let topicCategories: [String]
    public let topicIDs: [String]
    
    public enum CodingKeys: String, CodingKey {
        case topicCategories = "topicCategories"
        case topicIDs = "topicIds"
    }
}

public struct RelatedPlaylists: Codable {
    public let uploads: String
    public let watchHistory: String
    public let watchLater: String
}

public struct BrandingSettings: Codable {
    public let channelMetadata: ChannelMetadata
    public let hints: [Hint]
    public let image: Image
    
    public enum CodingKeys: String, CodingKey {
        case channelMetadata = "channel"
        case hints
        case image
    }
}

public struct Image: Codable {
    public let banner: URL
    public let mobile: URL
    public let mobileLow: URL
    public let mobileMediumHd: URL
    public let mobileHd: URL
    public let mobileExtraHd: URL
    public let tablet: URL
    public let tabletLow: URL
    public let tabletHd: URL
    public let tabletExtraHd: URL
    public let tv: URL
    public let tvLow: URL
    public let tvMedium: URL
    public let tvHigh: URL
    
    public enum CodingKeys: String, CodingKey {
        case banner         = "bannerImageUrl"
        case mobile         = "bannerMobileImageUrl"
        case mobileLow      = "bannerMobileLowImageUrl"
        case mobileMediumHd = "bannerMobileMediumHdImageUrl"
        case mobileHd       = "bannerMobileHdImageUrl"
        case mobileExtraHd  = "bannerMobileExtraHdImageUrl"
        case tablet         = "bannerTabletImageUrl"
        case tabletLow      = "bannerTabletLowImageUrl"
        case tabletHd       = "bannerTabletHdImageUrl"
        case tabletExtraHd  = "bannerTabletExtraHdImageUrl"
        case tv             = "bannerTvImageUrl"
        case tvLow          = "bannerTvLowImageUrl"
        case tvMedium       = "bannerTvMediumImageUrl"
        case tvHigh         = "bannerTvHighImageUrl"
    }
}

public struct Hint: Codable {
    public let property: String
    public let value: String
}

public struct ChannelMetadata: Codable {
    public let defaultTab: String
    public let description: String?
    public let featuredChannelsTitle: String
    public let featuredChannelsURLs: [String]?
    public let keywords: String
    public let profileColor: String
    public let showBrowseView: Bool
    public let showRelatedChannels: Bool
    public let title: String
    public let unsubscribedTrailer: String
    
    public enum CodingKeys: String, CodingKey {
        case defaultTab
        case description
        case featuredChannelsTitle
        case featuredChannelsURLs = "featuredChannelsUrls"
        case keywords
        case profileColor
        case showBrowseView
        case showRelatedChannels
        case title
        case unsubscribedTrailer
    }
}

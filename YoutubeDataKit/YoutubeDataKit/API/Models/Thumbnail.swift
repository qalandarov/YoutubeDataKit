//
//  Thumbnail.swift
//  YoutubeKit
//
//  Created by Ryo Ishikawa on 12/30/2017
//

import Foundation

// MARK: - Namespace
public enum Thumbnails {}

extension Thumbnails {
    public struct Default: Codable {
        public let url: String?
        public let height: Int?
        public let width: Int?
    }
}

extension Thumbnails {
    public struct SearchList: Codable {
        public let high: Default
        public let `default`: Default
        public let medium: Default
    }
}

extension Thumbnails {
    public struct VideoList: Codable {
        public let high: Default
        public let `default`: Default
        public let medium: Default
    }
}

extension Thumbnails {
    public struct ActivityList: Codable {
        public let high: Default
        public let medium: Default
        public let `default`: Default
        public let standard: Default?
        public let maxres: Default?
    }
}

extension Thumbnails {
    public struct PlaylistsList: Codable {
        public let high: Default
        public let medium: Default
        public let `default`: Default
        public let standard: Default
    }
}

extension Thumbnails {
    public struct PlaylistItemsList: Codable {
        public let high: Default
        public let medium: Default
        public let `default`: Default
        public let standard: Default
    }
}

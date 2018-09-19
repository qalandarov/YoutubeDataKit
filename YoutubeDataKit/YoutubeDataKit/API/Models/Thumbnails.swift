//
//  Thumbnails.swift
//  YoutubeKit
//
//  Created by Ryo Ishikawa on 12/30/2017
//

import Foundation

// MARK: - Namespace
public struct Thumbnails: Codable {
    //swiftlint:disable colon
    public struct Item: Codable {
        public let url:     String
        public let height:  Int
        public let width:   Int
    }
    
    public let `default`:   Item
    public let medium:      Item
    public let high:        Item
    public let standard:    Item?
    public let maxres:      Item?
    //swiftlint:enable colon
}

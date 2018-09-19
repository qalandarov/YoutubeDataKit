//
//  ChannelSnippetTests.swift
//  YoutubeDataKitTests
//
//  Created by Islam Qalandarov on 9/2/18.
//  Copyright © 2018 Qalandarov. All rights reserved.
//

import XCTest
@testable import YoutubeDataKit

class ChannelSnippetTests: BaseTestCase {
    
    //swiftlint:disable line_length
    private let snippetDescription = """
The Google Developers channel features talks from events, educational series, best practices, tips, and the latest updates across our products and platforms.
"""
    //swiftlint:enable line_length
    
    func testChannelSnippet() {
        guard let snippet: Snippet.ChannelList = decodeOrFail(fileName: "channel-snippet") else { return }
        
        XCTAssert(snippet.customURL == "GoogleDevelopers")
        XCTAssert(snippet.title == "Google Developers")
        XCTAssert(snippet.description == snippetDescription)
        XCTAssert(snippet.publishedAt == "2007-08-23T00:34:43.000Z")
        
        XCTAssert(snippet.localized.title == "Google Developers")
        XCTAssert(snippet.localized.description == snippetDescription)
        
        // Thumbnails are tested separately
    }
    
}

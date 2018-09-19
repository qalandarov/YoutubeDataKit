//
//  ChannelThumbnailsTests.swift
//  YoutubeDataKitTests
//
//  Created by Islam Qalandarov on 9/2/18.
//  Copyright © 2018 Qalandarov. All rights reserved.
//

import XCTest
@testable import YoutubeDataKit

class ChannelThumbnailsTests: BaseTestCase {
    
    func testChannelThumbnails() {
        guard let thumbnails: Thumbnails = decodeOrFail(fileName: "channel-thumbnails") else { return }
        
        let defURL = "https://yt3.ggpht.com/a-/ACSszfEtef_BbD3pT3IKMBPy_kxLobdfhjxxqZOg9Q=s88-mo-c-c0xffffffff-rj-k-no"
        XCTAssert(thumbnails.default.url == defURL)
        XCTAssert(thumbnails.default.width == 88)
        XCTAssert(thumbnails.default.height == 88)
        
        let medURL = "https://yt3.ggpht.com/a-/ACSszfEtef_BbD3pT3IKMBPy_kxLobdfhjxxqZOg9Q=s240-mo-c-c0xffffffff-rj-k-no"
        XCTAssert(thumbnails.medium.url == medURL)
        XCTAssert(thumbnails.medium.width == 240)
        XCTAssert(thumbnails.medium.height == 240)
        
        let hiURL = "https://yt3.ggpht.com/a-/ACSszfEtef_BbD3pT3IKMBPy_kxLobdfhjxxqZOg9Q=s800-mo-c-c0xffffffff-rj-k-no"
        XCTAssert(thumbnails.high.url == hiURL)
        XCTAssert(thumbnails.high.width == 800)
        XCTAssert(thumbnails.high.height == 800)
    }
    
}

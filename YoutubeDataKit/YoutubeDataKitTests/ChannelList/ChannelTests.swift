//
//  ChannelTests.swift
//  YoutubeDataKitTests
//
//  Created by Islam Qalandarov on 9/2/18.
//  Copyright © 2018 Qalandarov. All rights reserved.
//

import XCTest
@testable import YoutubeDataKit

class ChannelTests: BaseTestCase {
    
    func testChannel() {
        guard let channel: Channel = decodeOrFail(fileName: "channel") else { return }
        
        XCTAssert(channel.id == "UC_x5XG1OV2P6uZZ5FSM9Ttw")
        XCTAssert(channel.etag == "\"XI7nbFXulYBIpL0ayR_gDh3eu1k/MnmdWu6poyI3sLAtZ_bCvezfNoE\"")
        XCTAssert(channel.kind == "youtube#channel")
        
        XCTAssert(channel.statistics?.viewCount == "143364267")
        XCTAssert(channel.statistics?.commentCount == "0")
        XCTAssert(channel.statistics?.subscriberCount == "1627450")
        XCTAssert(channel.statistics?.hiddenSubscriberCount == false)
        XCTAssert(channel.statistics?.videoCount == "4790")
        
        // Snippet is tested separately
        XCTAssert(channel.snippet?.customURL == "GoogleDevelopers")
    }
    
}

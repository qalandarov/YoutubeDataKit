//
//  ChannelListTests.swift
//  YoutubeDataKitTests
//
//  Created by Islam Qalandarov on 8/24/18.
//  Copyright © 2018 Qalandarov. All rights reserved.
//

import XCTest
@testable import YoutubeDataKit

class ChannelListTests: BaseTestCase {
    
    func testChannelList() {
        guard
            let channel: Channel = decodeOrFail(fileName: "channel"),
            let channelList: ChannelList = decodeOrFail(fileName: "channel-list")
            else {
                return
        }
        
        XCTAssert(channelList.etag == "\"XI7nbFXulYBIpL0ayR_gDh3eu1k/nGRTA_EoINGM0oNx6WY_ZCsfrDk\"")
        XCTAssert(channelList.kind == "youtube#channelListResponse")
        XCTAssert(channelList.pageInfo.resultsPerPage == 5)
        XCTAssert(channelList.pageInfo.totalResults == 1)
        XCTAssertNil(channelList.nextPageToken)
        XCTAssertNil(channelList.prevPageToken)
        
        // Channel is tested separately
        XCTAssert(channelList.items.count == 1)
        XCTAssert(channelList.items.first?.id == channel.id)
    }
    
}

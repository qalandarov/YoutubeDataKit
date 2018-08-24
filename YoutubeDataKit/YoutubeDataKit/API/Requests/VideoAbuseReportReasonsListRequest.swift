//
//  VideoAbuseReportReasonsListRequest.swift
//  YoutubeKit
//
//  Created by Ryo Ishikawa on 12/30/2017
//

import Foundation

/// SeeAlso: https://developers.google.com/youtube/v3/docs/videoAbuseReportReasons/list
public struct VideoAbuseReportReasonsListRequest: Requestable {
    
    public typealias Response = VideoAbuseReportReasonsList

    public var path: String {
        return "videoAbuseReportReasons"
    }
    
    public var httpMethod: HTTPMethod {
        return .get
    }
    
    public var isAuthorizedRequest: Bool {
        return true
    }
    
    public var queryParameters: [String: Any] {
        var query: [String: Any] = ["part": part.toCSV()]
        query.appendingQueryParameter(key: "hl", value: hl)
        return query
    }
    
    // MARK: - Required parameters
    
    public let part: [Part.VideoAbuseReportReasonsList]
    
    // MARK: - Option parameters
    
    public let hl: String?
    
    public init(part: [Part.VideoAbuseReportReasonsList],
                hl: String? = nil) {
        self.part = part
        self.hl = hl
    }
}

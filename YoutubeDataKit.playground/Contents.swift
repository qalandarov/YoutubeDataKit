import UIKit
import YoutubeDataKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

// Set up API Key
YoutubeDataKit.shared.setAPIKey("API KEY")

// Get youtube chart ranking
let request = VideoListRequest(part: [.id, .statistics], filter: .chart)

// Send a request.
ApiSession.shared.send(request) { result in
    switch result {
    case .success(let response):
        print(response)
    case .failed(let error):
        print(error)
    }
}

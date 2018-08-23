# YoutubeDataKit

`YoutubeDataKit` is [YoutubeDataAPI (v3)](https://developers.google.com/youtube/v3/docs/) wrapper in Swift. It's a framework to make it easy to work with Youtube items (videos, playlists, channels...)

`YoutubeDataKit` is based on [YoutubeKit](https://github.com/rinov/YoutubeKit), but does *NOT* include the player.

[![Build Status](https://travis-ci.org/qalandarov/YoutubeDataKit.svg?branch=master)](https://travis-ci.org/qalandarov/YoutubeDataKit)
[![Maintainability](https://api.codeclimate.com/v1/badges/31c798508927c59ec097/maintainability)](https://codeclimate.com/github/qalandarov/YoutubeDataKit/maintainability)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/YoutubeDataKit.svg)](https://img.shields.io/cocoapods/v/YoutubeDataKit.svg)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-brightgreen.svg)]((https://img.shields.io/badge/Carthage-compatible-brightgreen.svg))
[![Swift](https://img.shields.io/badge/Swift-4-blue.svg)](https://img.shields.io/badge/Swift-4-blue.svg)

## Available API lists:

- Actitivty(list)
- Actitivty(insert)
- Caption(list)
- Channel(list)
- ChannelSections(list)
- Comment(list)
- CommentThreads(list)
- GuideCategories(list)
- PlaylistItems(list)
- Playlists(list)
- Search(list)
- Subscriptions(list)
- VideoAbuseReportReasons(list)
- VideoCategories(list)
- Videos(list)

# Get Started

### Get video information using YoutubeDataAPI
First, Get API key from [Here](https://console.developers.google.com/apis).

Next, add this code to your AppDelegate:

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    YoutubeDataKit.shared.setAPIKey(API_KEY)
    
    return true
}

```

And then you can use `YoutubeDataAPI` request like this.

```swift
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

```

Example of response here.

```ruby
VideoList(items: [YoutubeKit.Video(etag: "\"A8kisgyDEbllhHF9ooXPFFrkc/nR6_A9oyIoLTJuucY_UXeasjYNU\"",
kind: "youtube#video",
id: "jeiDjeJgF0",
contentDetails: nil,
statistics: Optional(YoutubeKit.Statistics.VideoList(dislikeCount: "1631", likeCount: "60307", commentCount: Optional("8675"), favoriteCount: "0", viewCount: "1259046")),
snippet: nil,
status: nil),
etag: "\"J67fSnfblalhHF0foXPiFFrkc/TZGPJdE22-LilSv4-3VNoPw1cS4\"",
kind: "youtube#videoListResponse",
pageInfo: YoutubeKit.PageInfo(resultsPerPage: 5, totalResults: 200))
```

### Fetch the next page (Pagination)
```swift
var nextPageToken: String?
...

// Send some request
ApiSession.shared.send(request) { [weak self] result in
    switch result {
    case .success(let response):
        // Save nextPageToken
        self?.nextPage = response.nextPageToken
    case .failed(let error):
        print(error)
    }
}
...

// Set nextPageToken
let request = VideoListRequest(part: [.id], filter: .chart, nextPageToken: nextPageToken)
```

### Authorization Request
If you want authorized request such as a getting your activity in Youtube, you set your access token before sending a request.
To use `GoogleSignIn`, you can easily get your access token.
`pod 'GoogleSignIn'`

First, add this code in your AppDelegate.

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    // Set your access token for autheticate request
    YoutubeKit.shared.setAccessToken("Your access token")
    
    return true
}
```

And then you can use request requiring authorization, this is an example to get your Youtube activity.

```swift
// Get your Youtube activity
let request = ActivityListRequest(part: [.snippet], filter: .mine(true))

// Send a request.
ApiSession.shared.send(request) { result in
    switch result {
    case .success(let video):
        print(video)
    case .failed(let error):
        print(error)
    }
}
```

## Requirements
iOS 9.3+

Xcode 9+

Swift 4+

## Installation

### Cocoapods

```
$ pod repo update
```

And add this to your Podfile:


```ruby
pod 'YoutubeDataKit'
```

and

`$ pod install`

### Carthage
Add this to your Cartfile:

`github "qalandarov/YoutubeDataKit"`

and

`$ carthage update`


## Original YoutubeKit Author

Github: [https://github.com/rinov](https://github.com/rinov)

Twitter: [https://twitter.com/rinov0321](https://twitter.com/rinov0321)

Email: rinov[at]rinov.jp

## License

YoutubeDataKit is available under the MIT license.

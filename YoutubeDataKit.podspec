Pod::Spec.new do |s|
  s.name             = 'YoutubeDataKit'
  s.version          = '0.5.0'
  s.summary          = 'YoutubeDataKit is a framework in Swift that wraps YoutubeDataAPI (v3).'

  s.description      = <<-DESC
YoutubeDataKit is a framework to make it easy to work with Youtube items (videos, playlists, channels...)
YoutubeDataKit is derived from YoutubeKit (by rinov) and extracted only the Data API part - Does *NOT* include the player!.
                       DESC

  s.homepage         = 'https://github.com/qalandarov/YoutubeDataKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'islam' => 'kalandarov.islom@gmail.com' }
  s.source           = { :git => 'https://github.com/qalandarov/YoutubeDataKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'

  s.source_files = 'YoutubeDataKit/YoutubeDataKit/**/*.swift'
  
 end

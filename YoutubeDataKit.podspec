Pod::Spec.new do |s|
  s.name             = 'YoutubeDataKit'
  s.version          = '0.3'
  s.summary          = 'YoutubeDataKit is a framework in Swift that wraps YoutubeDataAPI (v3).'

  s.description      = <<-DESC
YoutubeDataKit is a framework to make it easy to fetch information about Youtube items (videos, playlists, channels...) - Does NOT include the player!
                       DESC

  s.homepage         = 'https://github.com/qalandarov/YoutubeDataKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'islam' => 'qalandarov@me.com' }
  s.source           = { :git => 'https://github.com/qalandarov/YoutubeDataKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'YoutubeDataKit/**/.swift'
  
 end

Pod::Spec.new do |s|

  s.name               = 'XYJSocketRocket'
  s.version            = '0.0.1'
  s.summary            = 'SocketRocket改名版。原地址https://github.com/facebookarchive/SocketRocket。'
  s.homepage           = 'https://github.com/445257607/XYJSRWebSocket'
  s.authors            = { 'xiaoyingjun' => '445257607@qq.com' }
  s.license            = 'BSD'
  s.source             = { :git => 'https://github.com/445257607/XYJSRWebSocket.git', :tag => s.version.to_s }
  s.requires_arc       = true
  
  s.source_files       = 'XYJSocketRocket/**/*.{h,m}'
  s.public_header_files = 'XYJSocketRocket/*.h'

  s.ios.deployment_target  = '6.0'

  s.ios.frameworks     = 'CFNetwork', 'Security'

end
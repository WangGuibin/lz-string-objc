Pod::Spec.new do |s|
  s.name             = 'lz-string-objc'
  s.version          = '1.0.0'
  s.summary          = 'lz-string-objc is lz-string.js for objc implement interface call'

  s.description      = <<-DESC
  简单实现了lz-sting.js的Objc层的桥接调用
                       DESC

  s.homepage         = 'https://github.com/wangguibin1993@gmail.com/lz-string-objc'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'CoderWGB' => '864562082@qq.com' }
  s.source           = { :git => 'https://github.com/WangGuibin/lz-string-objc.git', :tag => s.version.to_s }
   s.social_media_url = 'https://twitter.com/06PBEc3aUWS4NSi'

  s.ios.deployment_target = '10.0'
  s.osx.deployment_target = '10.9'

  s.source_files = 'lz-string-objc/Classes/**/*'
end

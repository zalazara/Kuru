Pod::Spec.new do |s|
  s.name             = 'Kuru'
  s.version          = '0.0.2'
  s.summary          = 'Kuru is the easy way to manipulating ui data from a server in SwiftUI.'
  s.description      = <<-DESC
  Kuru is the easy way to manipulating ui data from a server in SwiftUI.
                       DESC
  s.homepage         = 'https://github.com/zalazara/Kuru'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Alejandro Zalazar' => 'azalazar@outlook.com.ar' }
  s.source           = { :git => 'https://github.com/zalazara/Kuru.git', :tag => s.version.to_s }
  s.ios.deployment_target = '13.0'
  s.source_files = 'Sources/**/*.swift'
  s.swift_version = '5.2'
end

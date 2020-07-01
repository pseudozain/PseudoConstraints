

Pod::Spec.new do |s|
  s.name             = 'PseudoConstraints'
  s.version          = '1.0.2'
  s.summary          = 'Easy interface to set constraints programatically'

  s.description      = 'Pseudo Constraints lets you set constraints programatically with less code. Pseudo Constraints uses native Swift APIs at its core hence making it more efficient.'

  s.homepage         = 'https://github.com/pseudozain'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'pseudozain' => 'e.zainulabedin@gmail.com' }
  s.source           = { :git => 'https://github.com/pseudozain/PseudoConstraints.git', :tag => s.version.to_s }

  s.module_name = s.name
  s.ios.deployment_target = '11.4'
  s.swift_version = '5.1'
  
  s.source_files = 'PseudoConstraints/**/*.{swift}'
  
  s.static_framework = true
end

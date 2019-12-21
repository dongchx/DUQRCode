#
# Be sure to run `pod lib lint DUQRCode.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DUQRCode'
  s.version          = '0.0.1'
  s.summary          = 'A QRCODE TOOL.'

  s.homepage         = 'https://github.com/dongchx/DUQRCode'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dongchx' => 'dongchx90@gmail.com' }
  s.source           = { :git => 'https://github.com/dongchx/DUQRCode.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  
  s.source_files = 'Classes/**/*.{h,m}'

end

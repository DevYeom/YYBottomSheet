#
# Be sure to run `pod lib lint YYBottomSheet.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YYBottomSheet'
  s.version          = '1.2.0'
  s.swift_version    = '5.0'
  s.summary          = 'Very Simple and Useful Bottom Sheet'

  s.description      = <<-DESC
  When you need to let users choose one of several or know informations by showing bottomSheet, you can use YYBottomSheet.
  Simple And Clear 😎
  DESC

  s.homepage              = 'https://github.com/DevYeom/YYBottomSheet'
  s.license               = { :type => 'MIT', :file => 'LICENSE' }
  s.author                = { 'DevYeom' => 'dev.yeom@gmail.com' }
  s.source                = { :git => 'https://github.com/DevYeom/YYBottomSheet.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'
  s.source_files          = 'YYBottomSheet/Classes/**/*'
  s.frameworks            = 'UIKit'
  s.resources             = 'YYBottomSheet/Assets/**/*'
end

#
# Be sure to run `pod lib lint YYBottomSheet.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
	s.name             = 'YYBottomSheet'
	s.version          = '1.0.0'
	s.summary          = 'Very Simple and Useful Bottom Sheet'

	s.description      = <<-DESC
	When you need to let user choose one of several, you can use YYBottomSheet.
	Simple And Clear 😎
	DESC

	s.homepage         = 'https://github.com/DevYeom/YYBottomSheet'
	# s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
	s.license          = { :type => 'MIT', :file => 'LICENSE' }
	s.author           = { 'DevYeom' => 'dev.yeom@gmail.com' }
	s.source           = { :git => 'https://github.com/DevYeom/YYBottomSheet.git', :tag => s.version.to_s }
	s.ios.deployment_target = '9.0'
	s.source_files = 'YYBottomSheet/Classes/**/*'
	s.frameworks = 'UIKit'
	s.resources = 'YYBottomSheet/Assets/**/*'
	# s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'


	# s.public_header_files = 'Pod/Classes/**/*.h'
	# s.dependency 'AFNetworking', '~> 2.3'
end

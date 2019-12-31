#
# Be sure to run `pod lib lint RxMJRefresh.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RxMJRefresh'
  s.version          = '0.1.0'
  s.summary          = 'MJRefresh with RxCocoa.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  MJRefresh with RxCocoa
                    DESC

  s.homepage         = 'https://github.com/FuYouFang/RxMJRefresh'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'FuYouFang' => 'fuyoufang@163.com' }
  s.source           = { :git => 'https://github.com/FuYouFang/RxMJRefresh.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'RxMJRefresh/Classes/**/*'
  s.swift_version = '5.0'
  s.frameworks = 'UIKit'
  s.dependency 'MJRefresh', '~> 3.2.0'
  s.dependency 'RxCocoa', '~> 4.5.0'
end

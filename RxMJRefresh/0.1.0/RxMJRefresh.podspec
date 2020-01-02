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

#  s.description      = <<-DESC
#  MJRefresh with RxCocoa
#                    DESC

  s.homepage         = 'https://github.com/FuYouFang/RxMJRefresh'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'FuYouFang' => 'fuyoufang@163.com' }
  s.source           = { :git => 'https://github.com/FuYouFang/RxMJRefresh.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'RxMJRefresh/Classes/**/*'
  s.swift_version = '5.0'
  s.frameworks = 'UIKit'
  s.dependency 'MJRefresh', '~> 3.2.0'
  s.dependency 'RxSwift', '~> 5.0'
  s.dependency 'RxCocoa', '~> 5.0'
  
end

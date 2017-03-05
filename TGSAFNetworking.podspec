#
#  Be sure to run `pod spec lint TGSAFNetworking.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "TGSAFNetworking"
  s.version      = "3.0.2"
  s.summary      = "A NetWorking is TGSAFNetworking."
  s.platform     = :ios, "7.0"
  s.description  = <<-DESC
一个基于 AF的网络请求,自己的库,
1.post 网络请求<TGSAFNetworking>
#import <TGSAFN.h>
TGSAFN 调用类方法
类似:
[TGSAFN postWithUrl:@"www.baidu.com" parameters:nil success:^(id responseObject) {
//请求成功...
UIAlertController *AVC = [UIAlertController alertControllerWithTitle:@"SUCCESS" message:@"成功了" preferredStyle: UIAlertControllerStyleAlert];
[AVC addAction:[UIAlertAction actionWithTitle:@"取消" style: UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

}]];
//网络连接失败...
[self presentViewController:AVC animated:YES completion:nil];
} fail:^{
UIAlertController *AVC = [UIAlertController alertControllerWithTitle:@"NO NETWORK" message:@" 失败了" preferredStyle: UIAlertControllerStyleAlert];
[AVC addAction:[UIAlertAction actionWithTitle:@"取消" style: UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

}]];
[self presentViewController:AVC animated:YES completion:nil];
}];

                   DESC

  s.homepage     = "https://github.com/ZTKevin/TGSAFNetworking"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "LICENSE" }




  s.author             = { "ZTKevin" => "773098249@qq.com" }

  #  When using multiple platforms
  s.ios.deployment_target = "7.0"


  s.source       = { :git => "https://github.com/ZTKevin/TGSAFNetworking.git", :tag => "#{s.version}" }

  s.source_files  = "TGSAFNetworking/*.{h,m}"
  s.exclude_files = "Classes/Exclude"
  # s.public_header_files = "Classes/**/*.h"

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end

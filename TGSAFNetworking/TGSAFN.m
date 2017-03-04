//
//  TGSAFN.m
//  OBD_Sever_Build
//
//  Created by 陶晨麟 on 15/8/14.
//  Copyright (c) 2015年 TGS. All rights reserved.
//
//
//
//
//
//
//
//
// 本文档将AFN方法静态化！

#import "TGSAFN.h"


@implementation TGSAFN
+ (void)netWorkStatus
{
    /**
     AFNetworkReachabilityStatusUnknown          = -1,  // 未知
     AFNetworkReachabilityStatusNotReachable     = 0,   // 无连接
     AFNetworkReachabilityStatusReachableViaWWAN = 1,   // 3G 花钱
     AFNetworkReachabilityStatusReachableViaWiFi = 2,   // WiFi
     */
    // 如果要检测网络状态的变化,必须用检测管理器的单例的startMonitoring
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    
    // 检测网络连接的单例,网络变化时的回调方法
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"%d", (int)status);
    }];
}


+ (void)postWithUrl:(NSString *)urlStr parameters:(id)parameters success:(void (^)(id responseObject))success fail:(void (^)())fail
{
    //NSLog(@"here");
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
//    [session GET:urlStr parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
//        NSLog(@"成功");
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        NSLog(@"失败");
//    }];
    
    [session POST:urlStr parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
        if (fail) {
            fail();
        }
    }];
    
   /* AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    // 设置请求格式
    //manager.requestSerializer = [AFJSONRequestSerializer serializer];
    // 设置返回格式
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //NSLog(@"here");
    [manager POST:urlStr parameters:parameters
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
//              NSString *result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
//              NSLog(@"%@",result);
              if (success) {
                  success(responseObject);
              }
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              NSLog(@"%@", error);
              if (fail) {
                  fail();
              }
          }];
    //NSLog(@"here");
   */
    
}

@end

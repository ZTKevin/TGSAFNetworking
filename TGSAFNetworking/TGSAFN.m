//
//  TGSAFN.m
//  OBD_Sever_Build
//
//  Created by 郑传文 on 17/04/28.
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
        
    }];
}


+ (void)postWithUrl:(NSString *_Nullable)urlStr parameters:(id _Nullable )parameters success:(void (^_Nullable)(id _Nullable responseObject))success fail:(void (^_Nullable)(NSError * _Nonnull error))fail
{
    //NSLog(@"here");
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager.requestSerializer setTimeoutInterval:10.0];
    //    [session GET:urlStr parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
    //        NSLog(@"成功");
    //    } failure:^(NSURLSessionDataTask *task, NSError *error) {
    //        NSLog(@"失败");
    //    }];
    
    [manager POST:urlStr parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) {
            fail(error);
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
+(void)uploadImageWithURL:(NSString*_Nullable)url parameters:(id _Nullable )param image:(UIImage*_Nullable)image imageName:(NSString*_Nullable)imagename success:(void (^_Nullable)(id _Nullable responseObject))success fail:(void (^_Nullable)(NSError * _Nonnull error))fail{
    
    //1。创建管理者对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager.requestSerializer setTimeoutInterval:10.0];
    //2.上传文件
    //    NSDictionary *dict = @{@"username":@"1234"};
    
    //    NSString *urlString = @"22222";
    [manager POST:url parameters:param constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //上传文件参数
        //        UIImage *iamge = [UIImage imageNamed:@"123.png"];
        NSData *imageData = UIImagePNGRepresentation(image);
        //这个就是参数
        // 上传的参数名
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        // 设置时间格式
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString * Name = [NSString stringWithFormat:@"%@%@",str, imagename];
        // 上传fileName
        NSString * fileName = [NSString stringWithFormat:@"%@.png", Name];
        
        [formData appendPartWithFileData:imageData name:@"file" fileName:fileName mimeType:@"image/png"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        //打印下上传进度
        NSLog(@"%lf",1.0 *uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
        //请求成功
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            fail(error);
        }
        //请求失败
    }];
    
}

+ (void)upLoadToUrlString:(NSString *_Nullable)url parameters:(NSDictionary* _Nullable )parameters fileData:(NSData* _Nullable )fileData name:(NSString* _Nullable )name fileName:(NSString* _Nullable )fileName mimeType:(NSString* _Nullable )mimeType response:(ResposeStyle)style progress:(void (^_Nullable)(NSProgress *_Nullable progress))progress success:(void (^_Nullable)(NSURLSessionDataTask* _Nullable task, id _Nullable responseObject))success failure:(void (^_Nullable)(NSURLSessionDataTask* _Nullable task, NSError * _Nullable error))failure {
    
    //1.获取单例的网络管理对象
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //2.根据style 的类型 去选择返回值得类型
    switch (style) {
        case JSON:
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
        case XML:
            manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
            break;
        case Data:
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
        default:
            break;
    }
    
    //3.设置相应数据支持的类型
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/plain", @"application/javascript",@"application/json", @"application/x-www-form-urlencoded", nil]];
    
    [manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        [formData appendPartWithFileData:fileData name:name fileName:fileName mimeType:mimeType];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        //打印下上传进度
        NSLog(@"%lf",1.0 *uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(task, responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            failure(task, error);
        }
    }];
}

@end

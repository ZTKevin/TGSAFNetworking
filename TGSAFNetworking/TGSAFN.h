//
//  TGSAFN.h
//  OBD_Sever_Build
//
//  Created by 郑传文 on 17/04/28.
//  Copyright (c) 2015年 TGS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface TGSAFN : NSObject

typedef NS_ENUM(NSUInteger, ResposeStyle) {
    JSON,
    XML,
    Data,
};

typedef NS_ENUM(NSUInteger, RequestStyle) {
    RequestJSON,
    RequestString,
    RequestDefault
};
typedef void (^TGSNetworkStatusBlock)(AFNetworkReachabilityStatus status);
@property (readwrite, nonatomic, copy) TGSNetworkStatusBlock _Nullable networkStatusBlock;

//检测网络状态
+ (void)netWorkStatus:(nullable void(^)(AFNetworkReachabilityStatus status))block;

//Post发送数据
//@param urlStr post地址
//@param parameters NSDictionary* 参量
//@param sccess ^(id responseObject)  成功回调block
//@param fail ^()fail   失败回调block
+ (void)postWithTimeUrl:(NSString *_Nullable)urlStr timeInWait:(CGFloat)time parameters:(id _Nullable )parameters success:(void (^_Nullable)(id _Nullable responseObject))success fail:(void (^_Nullable)(NSError * _Nonnull error))fail;

+ (void)postWithUrl:(NSString *_Nullable)urlStr  parameters:(id _Nullable )parameters success:(void (^_Nullable)(id _Nullable responseObject))success fail:(void (^_Nullable)(NSError * _Nonnull error))fail;
+(void)uploadImageWithURL:(NSString*_Nullable)url parameters:(id _Nullable )param image:(UIImage*_Nullable)image imageName:(NSString*_Nullable)imagename success:(void (^_Nullable)(id _Nullable responseObject))success fail:(void (^_Nullable)(NSError * _Nonnull error))fail;


+ (void)upLoadToUrlString:(NSString *_Nullable)url parameters:(NSDictionary* _Nullable )parameters fileData:(NSData* _Nullable )fileData name:(NSString* _Nullable )name fileName:(NSString* _Nullable )fileName mimeType:(NSString* _Nullable )mimeType response:(ResposeStyle)style progress:(void (^_Nullable)(NSProgress *_Nullable progress))progress success:(void (^_Nullable)(NSURLSessionDataTask* _Nullable task, id _Nullable responseObject))success failure:(void (^_Nullable)(NSURLSessionDataTask* _Nullable task, NSError * _Nullable error))failure;
@end

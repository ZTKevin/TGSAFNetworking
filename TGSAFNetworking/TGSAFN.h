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
//检测网络状态
+ (void)netWorkStatus;
//Post发送数据
//@param urlStr post地址
//@param parameters NSDictionary* 参量
//@param sccess ^(id responseObject)  成功回调block
//@param fail ^()fail   失败回调block
+ (void)postWithUrl:(NSString *_Nullable)urlStr parameters:(id _Nullable )parameters success:(void (^_Nullable)(id _Nullable responseObject))success fail:(void (^_Nullable)(NSError * _Nonnull error))fail;
+(void)uploadImageWithURL:(NSString*_Nullable)url parameters:(id _Nullable )param image:(UIImage*_Nullable)image imageName:(NSString*_Nullable)imagename success:(void (^_Nullable)(id _Nullable responseObject))success fail:(void (^_Nullable)(NSError * _Nonnull error))fail;
@end

//
//  TGSAFN.h
//  OBD_Sever_Build
//
//  Created by 陶晨麟 on 15/8/14.
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
+ (void)postWithUrl:(NSString *)urlStr parameters:(id)parameters success:(void (^)(id responseObject))success fail:(void (^)())fail;
@end

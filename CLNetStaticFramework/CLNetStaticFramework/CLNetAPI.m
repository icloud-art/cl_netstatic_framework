//
//  CLNetAPI.m
//  CLNetStaticFramework
//
//  Created by Leo on 2018/11/30.
//  Copyright © 2018 Leo. All rights reserved.
//

#import "CLNetAPI.h"
#import <AFNetworking/AFNetworking.h>

@implementation CLNetAPI

+ (void)testRequestAPI {
    [[AFHTTPSessionManager manager] POST:@""
                              parameters:nil
               constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
                                 }
                                progress:^(NSProgress * _Nonnull uploadProgress) {}
                                 success:^(NSURLSessionDataTask *operation, id responseObject) {
                                     NSLog(@"调用了请求成功的回调");
                                 }
                                 failure:^(NSURLSessionDataTask *operation, NSError *error) {
                                     NSLog(@"调用了事情失败的回调");
                                 }];
}

@end

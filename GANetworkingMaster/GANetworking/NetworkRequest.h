//
//  NetworkRequest.h
//  GANetworkingMaster
//
//  Created by GikkiAres on 4/19/16.
//  Copyright © 2016 GikkiAres. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkRequest : NSObject

typedef void (^RequestSucBlock)(NSData *data,NSURLResponse *response);
typedef void (^RequestFailBlock)(NSError *error);


+ (void)requestPostWithUrl:(NSString *)strURL
                 Parameter:(NSDictionary *)dicParameter
                  SucBlock:(RequestSucBlock)blockSuc
                 FailBlock:(RequestFailBlock)blockFail;
+ (void)requestGetWithUrl:(NSString *)strURL
                Parameter:(NSDictionary *)dicParameter
                 SucBlock:(RequestSucBlock)blockSuc
                FailBlock:(RequestFailBlock)blockFail;




@end

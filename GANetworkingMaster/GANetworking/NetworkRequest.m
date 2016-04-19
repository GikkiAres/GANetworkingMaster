//
//  NetworkRequest.m
//  GANetworkingMaster
//
//  Created by GikkiAres on 4/19/16.
//  Copyright © 2016 GikkiAres. All rights reserved.
//

#import "NetworkRequest.h"

@implementation NetworkRequest
+ (void)requestPostWithUrl:(NSString *)strURL Parameter:(NSDictionary *)dicParameter SucBlock:(RequestSucBlock)blockSuc FailBlock:(RequestFailBlock)blockFail {
  
  //1 NSURLRequest
  NSURL *url = [NSURL URLWithString:strURL];
  NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
  request.HTTPMethod = @"POST";
  if (dicParameter) {
    NSString *str = [self stringFromDic:dicParameter WithSeparator:@"&"];
    request.HTTPBody = [str dataUsingEncoding:NSUTF8StringEncoding];
  }
  
  //2 NSURLSession
  NSURLSession *session = [NSURLSession sharedSession];
  NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    if (error) {
      NSLog(@"%@",error.userInfo);
      blockFail(error);
    }
    else {
      NSLog(@"data:%@\nresponse:%@",data,response);
      blockSuc(data,response);
    }
  }];
  [task resume];
}

+ (void)requestGetWithUrl:(NSString *)strURL Parameter:(NSDictionary *)dicParameter SucBlock:(RequestSucBlock)blockSuc FailBlock:(RequestFailBlock)blockFail {
  //1 NSURLRequest
  if (dicParameter) {
    NSString *str = [self stringFromDic:dicParameter WithSeparator:@"&"];
    strURL = [NSString stringWithFormat:@"%@?%@",strURL,str];
  }
  NSURL *url = [NSURL URLWithString:strURL];
  NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
  request.HTTPMethod = @"GET";
  request.timeoutInterval = 5;
  
  //2 NSURLSession
  NSURLSession *session = [NSURLSession sharedSession];
  NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    if (error) {
      NSLog(@"%@",error.userInfo);
      blockFail(error);
    }
    else {
      NSLog(@"data:%@\nresponse:%@",data,response);
      blockSuc(data,response);
    }
  }];
  [task resume];
}

+ (NSString *)stringFromDic:(NSDictionary<NSString *,NSString *> *)dic WithSeparator:(NSString *)strSeparator {
  NSArray *arrKeys = dic.allKeys;
  NSArray *arrValues = dic.allValues;
  NSMutableString *mstr = [NSMutableString string];
  for (int i =0;i<arrKeys.count;i++) {
    [mstr appendFormat:@"%@=%@",arrKeys[i],arrValues[i]];
    if (i<arrKeys.count-1) {
      [mstr appendString:strSeparator];
    }
  }
  return [mstr copy];
}
@end

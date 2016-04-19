//
//  GANetworkingMaster.m
//  GANetworkingMaster
//
//  Created by GikkiAres on 4/19/16.
//  Copyright © 2016 GikkiAres. All rights reserved.
//

#import "GANetworkingMaster.h"
#import "NetworkRequest.h"

@interface GANetworkingMaster ()

@end

@implementation GANetworkingMaster

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickPostBtn:(id)sender {
  NSString *strURL = @"https://www.baidu.com";
  [NetworkRequest requestPostWithUrl:strURL Parameter:nil SucBlock:^(NSData *data, NSURLResponse *response) {
    NSLog(@"suc");
  } FailBlock:^(NSError *error) {
    
  }];
}

- (IBAction)clickGetBtn:(id)sender {
  NSString *strURL = @"https://www.baidu.com";
  NSDictionary *dic = @{
                        @"1":@"adf",
                        @"2":@"af",
                        @"3":@"aff"
                        };
  [NetworkRequest requestGetWithUrl:strURL Parameter:dic SucBlock:^(NSData *data, NSURLResponse *response) {
    NSLog(@"suc");
  } FailBlock:^(NSError *error) {
    
  }];
}

@end

//
//  GrowingIOTrackerProxy.m
//  GrowingIOTracker
//
//  Created by 李嘉辉 on 2020/8/26.
//  Copyright © 2020 growingio. All rights reserved.
//
#import "GrowingIOTrackerProxy.h"

@implementation GrowingIOTrackerProxy

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSDictionary *plistDic = [[NSBundle mainBundle] infoDictionary];
    
    NSNumber *isDebug = [plistDic objectForKey:@"growing_ios_debug"];
    if (isDebug) {
        [Growing setEnableLog:[isDebug boolValue]];
    }
    
    NSString *zone = [plistDic objectForKey:@"growing_zone"];
    if (zone.length) {
        [Growing setZone:zone];
    }
    
    NSString *gtaHost = [plistDic objectForKey:@"growing_gta_host"];
    if (gtaHost.length) {
        [Growing setGtaHost:gtaHost];
    }
    
    NSString *dataHost = [plistDic objectForKey:@"growing_data_host"];
    if (dataHost.length) {
        [Growing setDataHost:dataHost];
    }
    
    NSString *reportHost = [plistDic objectForKey:@"growing_report_host"];
    if (reportHost.length) {
        [Growing setReportHost:reportHost];
    }
    
    NSString *wsHost = [plistDic objectForKey:@"growing_ws_host"];
    if (wsHost.length) {
        [Growing setWsHost:wsHost];
    }
    
    NSString *trackerHost = [plistDic objectForKey:@"growing_tracker_host"];
    if (trackerHost.length) {
        [Growing setTrackerHost:trackerHost];
    }
    
    NSString *accountId = [plistDic objectForKey:@"growing_ios_account_id"];
    if (accountId.length) {
        [Growing startWithAccountId:accountId];
    } else {
        NSLog(@"GrowingIO启动失败:accountId不能为空");
    }
    
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    if ([Growing handleUrl:url]) {
        return YES;
    }
    return NO;
}

@end

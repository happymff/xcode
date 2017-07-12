//
//  AppDelegate.m
//  GetBundleID
//
//  Created by mff on 2017/7/10.
//  Copyright © 2017年 mff. All rights reserved.
//

#import "AppDelegate.h"
#include <objc/runtime.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //获取手机上所有的app
//    Class LSApplicationWorkspace_class = objc_getClass("LSApplicationWorkspace");
//    NSObject *workspace = [LSApplicationWorkspace_class performSelector:@selector(defaultWorkspace)];
//    NSArray *apps = [workspace performSelector:@selector(allInstalledApplications)];
//    
//    Class LSApplicationProxy_class = objc_getClass("LSApplicationProxy");
//    for (int i = 0; i < apps.count; i++) {
//        NSObject *temp = apps[i];
//        if ([temp isKindOfClass:LSApplicationProxy_class]) {
//            //应用的bundleId
//            NSString *appBundleId = [temp performSelector:NSSelectorFromString(@"applicationIdentifier")];
//            //应用的名称
//            NSString *appName = [temp performSelector:NSSelectorFromString(@"localizedName")];
//            //应用的类型是系统的应用还是第三方的应用
//            NSString * type = [temp performSelector:NSSelectorFromString(@"applicationType")];
//            //应用的版本
//            NSString * shortVersionString = [temp performSelector:NSSelectorFromString(@"shortVersionString")];
//            
//            NSLog(@"类型=%@应用的BundleId=%@ ++++应用的名称=%@版本号=%@",type,appBundleId,appName,shortVersionString);
//            
//        }
//    }
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

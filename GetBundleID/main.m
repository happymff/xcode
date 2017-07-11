//
//  main.m
//  GetBundleID
//
//  Created by mff on 2017/7/10.
//  Copyright © 2017年 mff. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#include <objc/runtime.h>

int main(int argc, char * argv[]) {
    //获取手机上所有的app
    Class LSApplicationWorkspace_class = objc_getClass("LSApplicationWorkspace");
    NSObject *workspace = [LSApplicationWorkspace_class performSelector:@selector(defaultWorkspace)];
    NSArray *apps = [workspace performSelector:@selector(allInstalledApplications)];
    
    Class LSApplicationProxy_class = objc_getClass("LSApplicationProxy");
    for (int i = 0; i < apps.count; i++) {
        NSObject *temp = apps[i];
        if ([temp isKindOfClass:LSApplicationProxy_class]) {
            //应用的bundleId
            NSString *appBundleId = [temp performSelector:NSSelectorFromString(@"applicationIdentifier")];
            //应用的名称
            NSString *appName = [temp performSelector:NSSelectorFromString(@"localizedName")];
            //应用的类型是系统的应用还是第三方的应用
            NSString * type = [temp performSelector:NSSelectorFromString(@"applicationType")];
            //应用的版本
            NSString * shortVersionString = [temp performSelector:NSSelectorFromString(@"shortVersionString")];
            
            NSLog(@"类型=%@应用的BundleId=%@ ++++应用的名称=%@版本号=%@",type,appBundleId,appName,shortVersionString);
            
            
        }
    }

    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}


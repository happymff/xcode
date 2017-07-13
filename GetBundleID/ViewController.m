//
//  ViewController.m
//  GetBundleID
//
//  Created by mff on 2017/7/10.
//  Copyright © 2017年 mff. All rights reserved.
//

#import "ViewController.h"
#include <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

-(void) createUI{
    //获取手机上所有的app
        Class LSApplicationWorkspace_class = objc_getClass("LSApplicationWorkspace");
        NSObject *workspace = [LSApplicationWorkspace_class performSelector:@selector(defaultWorkspace)];
        NSArray *apps = [workspace performSelector:@selector(allInstalledApplications)];
        NSString *appBundleId;
        NSString *appName;
        NSString *string;
        NSString *string3= @"BundleID：";
        NSString *string1= @"\n应用名：";
        NSString *string2= @"\n";
        Class LSApplicationProxy_class = objc_getClass("LSApplicationProxy");
        for (int i = 0; i < apps.count; i++) {
            NSObject *temp = apps[i];
            if ([temp isKindOfClass:LSApplicationProxy_class]) {
                //应用的bundleId
                appBundleId = [temp performSelector:NSSelectorFromString(@"applicationIdentifier")];
                //应用的名称
                appName = [temp performSelector:NSSelectorFromString(@"localizedName")];
                //应用的类型是系统的应用还是第三方的应用
                NSString * type = [temp performSelector:NSSelectorFromString(@"applicationType")];
                //应用的版本
                NSString * shortVersionString = [temp performSelector:NSSelectorFromString(@"shortVersionString")];
    
               //NSLog(@"类型=%@应用的BundleId=%@ ++++应用的名称=%@版本号=%@",type,appBundleId,appName,shortVersionString);
                string = [[NSString alloc] initWithFormat:@"%@%@%@%@%@%@",string3,
                          appBundleId, string1,appName,string2,string];
    
                //string1 = [appBundleId stringByAppendingString:string1];
            }
        }
    UITextView * textView = [[UITextView alloc] init];
    textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 80, 300, 400)];
    textView.text = string;
    textView.textColor = [UIColor blackColor];
    textView.font = [UIFont systemFontOfSize:16.f];
    textView.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:textView];
}

//-(void) createUI1{
//    //获取手机上所有的app
//    Class LSApplicationWorkspace_class = objc_getClass("LSApplicationWorkspace");
//    NSObject *workspace = [LSApplicationWorkspace_class performSelector:@selector(defaultWorkspace)];
//    NSArray *apps = [workspace performSelector:@selector(allInstalledApplications)];
//    NSString *appBundleId;
//    NSString *appName;
//    NSString *string;
//    NSString *string3= @"BundleID：";
//    NSString *string1= @"\n应用名：";
//    NSString *string2= @"\n";
//    Class LSApplicationProxy_class = objc_getClass("LSApplicationProxy");
//    for (int i = 0; i < apps.count; i++) {
//        NSObject *temp = apps[i];
//        if ([temp isKindOfClass:LSApplicationProxy_class]) {
//            //应用的bundleId
//            appBundleId = [temp performSelector:NSSelectorFromString(@"applicationIdentifier")];
//            //应用的名称
//            appName = [temp performSelector:NSSelectorFromString(@"localizedName")];
//            //应用的类型是系统的应用还是第三方的应用
//            NSString * type = [temp performSelector:NSSelectorFromString(@"applicationType")];
//            //应用的版本
//            NSString * shortVersionString = [temp performSelector:NSSelectorFromString(@"shortVersionString")];
//            
//           // NSLog(@"类型=%@应用的BundleId=%@ ++++应用的名称=%@版本号=%@",type,appBundleId,appName,shortVersionString);
//            string = [[NSString alloc] initWithFormat:@"%@%@%@%@%@%@",string3,
//                      appBundleId, string1,appName,string2,string];
//
//            //string1 = [appBundleId stringByAppendingString:string1];
//        }
//    }
//    CGSize s=[string boundingRectWithSize:CGSizeMake(250, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
//   
//    UILabel* uilabel = [[UILabel alloc] init];
//    uilabel.text = string;
//    uilabel.font =[UIFont systemFontOfSize:14];
//    uilabel.numberOfLines =0;//必须有的
//    uilabel.frame = CGRectMake(20, 20, s.width,s.height);
//    [self.view addSubview:uilabel];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createUI];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

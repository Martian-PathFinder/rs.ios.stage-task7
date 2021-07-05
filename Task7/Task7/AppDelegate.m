//
//  AppDelegate.m
//  Task7
//
//  Created by Alexey on 7/2/21.
//  Copyright © 2021 PathFinder. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
 
    UIWindow *window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
    
    LoginVC *loginVC = [[LoginVC alloc] init];
    [window setRootViewController:loginVC];
    
    self.window = window;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end

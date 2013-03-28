//
//  AppDelegate.m
//  API_Mobile
//
//  Created by R MAC on 13/2/19.
//  Copyright (c) 2013年 R MAC. All rights reserved.
//

#import "AppDelegate.h"
#import "Moodle_API.h"
@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    NSDictionary * loginDic =  [Moodle_API Login:@"09957037" andPassword:@"L124631945"];
    NSString * token = [loginDic objectForKey:@"token"];
    /*NSDictionary * courseDic = [Moodle_API GetCourse_AndUseToken:token];
    NSLog(@"%@",courseDic);
    
    NSDictionary *courseInfoDic = [Moodle_API GetCourseInfo_AndUseToken:token courseID:@"B57031GR" classID:@"A"];
    NSLog(@"%@",courseInfoDic);*/
    
    NSDictionary *moodleInfoDic = [Moodle_API GetMoodleInfo_AndUseToken:token courseID:@"B57031GR" classID:@"A"];
    NSLog(@"%@",moodleInfoDic);
    
  /*  NSDictionary *gradeDic = [Moodle_API GetGrade_AndUseToken:token courseID:@"M5701P9D" classID:@"A"];
    NSLog(@"%@",gradeDic);
    
    NSDictionary *MoodleID_Dic = [Moodle_API GetMoodleID_AndUseToken:token courseID:@"M5701P9D" classID:@"A"];
    NSLog(@"%@",MoodleID_Dic);
    NSArray * arr = [Moodle_API getFilesFolder_InDir:@"/21556/課程講義"];*/
    // [Moodle_API GetPathOfDownloadFiles_fileName:@"_10_JavaScript_for_Ajax_-_example.rar" FromDir:@"/19367/課程講義"];
   // [Moodle_API CleanUpAllTheFiles];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

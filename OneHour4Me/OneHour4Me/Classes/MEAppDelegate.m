//
//  MEAppDelegate.m
//  OneHour4Me
//
//  Created by Meng Yu on 5/4/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEAppDelegate.h"
#import "MEWelcomeController.h"

@implementation MEAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    MEWelcomeController *welcomeController = [[MEWelcomeController alloc] initWithNibName:@"welcome" bundle:nil];
    /*
     == CAUTION: ==
     We must initialize 'navigationController' as a class instance field rather than as a local variable (and release it after 
        execute '[self.window addSubview:navigationController.view];')!
     Because when we handle the event triggered on sub controller of navigation controller, we will not get that sub controller,
        so that we will a tricky error, likes "
            Terminating app due to uncaught exception 'NSInvalidArgumentExcepton' reason:'[NSCFString didClicked:]: unrecognized
            sent to instance 0x44ele0'
        ", or nothing than '(lldb)'.
     */
    navigationController = [[UINavigationController alloc] initWithRootViewController:welcomeController];
    navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    [self.window addSubview:navigationController.view];
    [welcomeController release];
    
    [self.window makeKeyAndVisible];
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

- (void)dealloc {
    [navigationController release];
    
    [super dealloc];
}

@end

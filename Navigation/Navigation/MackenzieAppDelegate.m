//
//  MackenzieAppDelegate.m
//  Navigation
//
//  Created by Vinicius Miana on 2/21/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "MackenzieAppDelegate.h"
#import "Letra.h"
#import "NavigationDictionaryViewController.h"
#import "TabbedDictionaryViewController.h"
#import "Alfabeto.h"

@implementation MackenzieAppDelegate 

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    //[self.tabBarController setDelegate:self];
    self.tabBarController = [[UITabBarController alloc] init];
    
    Alfabeto *alfabeto = [Alfabeto sharedInstance];
    
    NavigationDictionaryViewController *navViewController = [[NavigationDictionaryViewController alloc] initWithNibName:nil bundle:nil];
    [navViewController setLetraAtual:[alfabeto proximaLetra]];
    
    self.navigationController = [[UINavigationController alloc]
                                 initWithRootViewController:navViewController];
    
    
    
    TabbedDictionaryViewController *tabViewController = [[TabbedDictionaryViewController alloc] initWithNibName:nil bundle:nil];
    
    
    
    NSArray *controllers = [NSArray arrayWithObjects:self.navigationController, tabViewController, nil];
    
    [self.tabBarController setViewControllers:controllers];

    [self.navigationController.tabBarItem setTitle:@"Navegação"];
    [self.navigationController.tabBarItem setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"navDicionario" ofType:@"png"]]];
    
    [tabViewController.tabBarItem setTitle:@"Tabela"];
    [tabViewController.tabBarItem setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tabDicionario" ofType:@"png"]]];
    
    
    self.window = [[UIWindow alloc]
                   initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.tabBarController;
    
    self.window.backgroundColor = [UIColor whiteColor];
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

@end

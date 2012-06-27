//
//  GDAppDelegate.h
//  GraphWithSounds
//
//  Created by Gene De Lisa on 6/26/12.
//  Copyright (c) 2012 Rockhopper Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GDViewController.h"
#import "GDSoundEngine.h"

@interface GDAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, retain) IBOutlet GDViewController *viewController;

@property (strong, nonatomic) id soundEngine;

@end

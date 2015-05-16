//
//  UIViewController+UIViewController_ShowLicense.m
//  LVC_demo
//
//  Created by Pavel Lint on 5/16/15.
//  Copyright (c) 2015 Pavel Lint. All rights reserved.
//

#import "UIViewController+UIViewController_ShowLicense.h"
#import "LicenseViewController.h"

@implementation UIViewController (UIViewController_ShowLicense)


-(void) showLicense
{
    LicenseViewController* v = [[LicenseViewController alloc] init];
    [self presentViewController:v animated:true completion:nil];
}

-(void) showLicenseAtFirstLaunch
{
    
    bool launched = [[NSUserDefaults standardUserDefaults]
                                             boolForKey:@"lvc.launched"];
    
    
    if( launched )
        return;
    
    
    
    [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"lvc.launched"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    
    [self showLicense];
}



@end

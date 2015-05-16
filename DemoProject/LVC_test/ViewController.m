//
//  ViewController.m
//  LVC_test
//
//  Created by Pavel Lint on 5/16/15.
//  Copyright (c) 2015 Pavel Lint. All rights reserved.
//

#import "ViewController.h"
#import "LicenseViewController/LicenseViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction) doShowLicense:(id)sender
{
    [self showLicense];
}

-(IBAction) doShowLicenseOnce:(id)sender
{
    [self showLicenseAtFirstLaunch];
}


-(void) viewDidAppear:(BOOL)animated
{
    
}

@end

//
//  LicenseViewController.h
//  LVC_demo
//
//  Created by Pavel Lint on 5/15/15.
//  Copyright (c) 2015 Pavel Lint. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+UIViewController_ShowLicense.h"

@interface LicenseViewController : UIViewController

    // 'Accept' button title.
    //  Default: NSLocalizedString(@"license.accept", nil);
    //  If no localized string found, fall back to 'Accept' string
    @property NSString* acceptTitle;


    // 'Reject' button title.
    //  Default: NSLocalizedString(@"license.reject", nil);
    //  if no localized string found, fall back to 'Reject' string
    @property NSString* rejectTitle;


    // The license text.
    // Default: read from 'license.md' file.
    // Don't forget to copy the license.md file to the bundle! (Build Phases -> Copy Resources)
    @property NSString* licenseText;

@end
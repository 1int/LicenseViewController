# LicenceViewController readme

## Abstract
So, once in a while you need to do the same thing in your iOS apps: show a license agreement. 
I've searched google for a solution which would do it for you in one line of code so that you wouldn't have to 
create a new controller, put in the storyboard, etc. I found nothing. So here it is now.

##Setup
Using pods:

    pod 'AttributedMarkdown', :git => 'https://github.com/dreamwieber/AttributedMarkdown.git'
    pod 'LicenseViewController', :git => 'https://github.com/1int/LicenseViewController.git'


## Zero configuration
To show your license, just use this  code in your controller:

    #import <LicenseViewController/LicenseViewController.h>    

    -(IBAction) onButtonClicked:(id)sender
    {
        [self showLicense];
    }

Also, if you want the license to show only once (when user first launches the app), you can do

    #import <LicenseViewController/LicenseViewController.h>  

    -(void) viewDidAppear:(BOOL)animated
    {
        [self showLicenseAtFirstLaunch];
    }

This will only show the license at the app's first launch.


The license is read from a resource named **license.md** in your main bundle.
Edit this file to set your own license. It's in markdown (as well as this readme). If you are not familiar with markdown, here's the link: http://daringfireball.net/projects/markdown/. 

**Don't forget to copy license.md resource**. Click your project, go to Build Phases -> Copy Bundle Resources.
Make sure license.md file is copied.


## Customizing
You can customize Accept/Reject buttons title.
Go to your Localizable.strings file (or create one if you don't have it) and set the titles there. For example, if you want Finnish:

    "license.accept" = "hyväksyä";
    "license.reject" = "aleneminen";


Also, if you don't want to edit the license.md file, you can set the licenseText property of LicenseViewController directly.
Demo project included.

Enjoy.
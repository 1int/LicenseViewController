//  Created by Pavel Lint on 5/15/15.
//  Copyright (c) 2015 Pavel Lint. All rights reserved.
//  Mail to: pavel@1int.org

#import "LicenseViewController.h"
#import <AttributedMarkdown/markdown_lib.h>
#import <AttributedMarkdown/markdown_peg.h>


#define TOOLBAR_HEIGHT 45


@interface LicenseViewController ()

@end

@implementation LicenseViewController
{
    UITextView* textView;
    UIToolbar *toolbar;
    
    //the real text show to user
    NSAttributedString* theText;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setup];
    [self createUI];
    [self setConstraints];
}



// setting up button labels and license text
-(void) setup
{
    
    // labels
        if( self.acceptTitle == nil )
            self.acceptTitle = NSLocalizedString(@"license.accept", nil);
        if( [self.acceptTitle isEqualToString:@"license.accept"] )
            self.acceptTitle = @"Accept";
        
        if( self.rejectTitle == nil )
            self.rejectTitle = NSLocalizedString(@"license.reject", nil);
        if( [self.rejectTitle isEqualToString:@"license.reject"] )
            self.rejectTitle = @"Reject";
    
    // setting up markdown attributes
    
        UIFont *h1 = [UIFont boldSystemFontOfSize:36];
        UIFont *h2 = [UIFont boldSystemFontOfSize:24];
        UIFont *strong = [UIFont boldSystemFontOfSize:12];
        
        // create a dictionary to hold your custom attributes for any Markdown types
        NSDictionary *attributes = @{
                                     @(H1): @{NSFontAttributeName : h1},
                                     @(H2): @{NSFontAttributeName : h2},
                                     @(STRONG): @{NSFontAttributeName : strong},
                                     
                                     };

    
    
    // licnese text

        if( self.licenseText != nil )
            theText = [[NSAttributedString alloc] initWithString:self.licenseText];

    
        if( theText == nil )
        {
            
            NSString *rawText = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"license" ofType:@"md"]  encoding:NSUTF8StringEncoding error:nil];
            
            if( rawText != nil )
                theText = markdown_to_attr_string( rawText, 0, attributes);
        }
    
    
        if( theText == nil )
        {
            
            NSString* demo = @"##Just a demo\n\nLorem ipsum dolor sit amet, purto sale doming te ius. Nam semper offendit an, usu an munere graeci tacimates. Per in tantas invidunt pertinacia. Ea cum esse ornatus suscipiantur. \n Id quis novum omnesque vim. Has errem facilis mediocritatem ei, vis at case utinam intellegebat, est no duis percipitur ullamcorper. His harum malorum appellantur te. Ex vel doctus molestie euripidis, ea latine denique corrumpit mei. In eum sint option, cum wisi augue scripta in. \nVim no liber discere, id pro maiestatis elaboraret. Vix graeco albucius complectitur an, ei nam ferri partiendo honestatis, audiam euripidis ne eam. Ut eos nullam electram, no nullam adipisci platonem nam. An duo dicat homero noster, nec nihil reprehendunt ex. Ea autem audiam molestiae vix. Cu mei paulo quidam forensibus, ei hinc lorem cotidieque pri, menandri sententiae consequuntur cu vis. \nHinc lorem dolor et usu, consul expetenda assentior id vis. No has porro aeque, modo ponderum vis ei. Est cu natum officiis mandamus, modo inermis ponderum ne vis. Summo nihil ut vel, et augue congue iuvaret sit. Ad nibh recusabo vis. Eu qui quod eripuit fastidii, has tota incorrupte ut. \n\nEa graecis imperdiet est, id iuvaret mnesarchum nec. Id sed scripta deserunt praesent, libris commodo at mel, eu his senserit recteque disputationi. Qui lorem graeco civibus cu, cum affert nemore volutpat ad. Est ex aliquip meliore accumsan, vero eius brute eos cu, aliquam gubergren id est. Id nec consetetur dissentiet, eam rebum definitionem concludaturque te.";
            theText = markdown_to_attr_string( demo, 0, attributes);
        }
    
    
    
    

}



-(void) createUI
{

    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    
    
    textView = [[UITextView alloc] init];
    textView.frame = CGRectMake(0, 30, self.view.frame.size.width, self.view.frame.size.height-TOOLBAR_HEIGHT);
    
    
    
    
    textView.attributedText = theText;
    textView.editable = false;
    
    
    [self.view addSubview:textView];
    
    
    toolbar = [[UIToolbar alloc] init];
    toolbar.frame = CGRectMake(0, self.view.frame.size.height-44, self.view.frame.size.width, TOOLBAR_HEIGHT);
    
    
    UIBarButtonItem *flexibleItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithTitle:self.acceptTitle style: UIBarButtonItemStylePlain target:self action:@selector(onAccept:)];
    
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithTitle:self.rejectTitle style: UIBarButtonItemStylePlain target:self action:@selector(onReject:)];
    
    NSArray *items = [NSArray arrayWithObjects:item1, flexibleItem, item2, nil];
    toolbar.items = items;
    
    [self.view addSubview:toolbar];
    
    
    textView.translatesAutoresizingMaskIntoConstraints = NO;
    toolbar.translatesAutoresizingMaskIntoConstraints = NO;
}


-(void) setConstraints
{
    
    
    //1. Textview left is equal to horizontal container margin
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem: textView
                              attribute:NSLayoutAttributeLeft
                              relatedBy:NSLayoutRelationEqual
                              toItem: self.view
                              attribute:NSLayoutAttributeLeftMargin
                              multiplier:1
                              constant: 0]];
    
    //2. Textview right is equal to horizontal container margin
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem: textView
                              attribute:NSLayoutAttributeRight
                              relatedBy:NSLayoutRelationEqual
                              toItem: self.view
                              attribute:NSLayoutAttributeRightMargin
                              multiplier:1
                              constant: 0]];
    
    //3. Textview top is equal to vertical container margin + 20
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem: textView
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem: self.view
                              attribute:NSLayoutAttributeTopMargin
                              multiplier:1
                              constant: 20]];
    
   //4. Textview bottom is equal to vertical container margin
        [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem: textView
                              attribute:NSLayoutAttributeBottom
                              relatedBy:NSLayoutRelationEqual
                              toItem: self.view
                              attribute:NSLayoutAttributeBottomMargin
                              multiplier:1
                              constant:0.0]];
    
    
    //5. Toolbar left is equal to view's left
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem: toolbar
                              attribute:NSLayoutAttributeLeft
                              relatedBy:NSLayoutRelationEqual
                              toItem: self.view
                              attribute:NSLayoutAttributeLeft
                              multiplier:1
                              constant: 0]];


    //6. Toolbar right is equal to view's right
            [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem: toolbar
                              attribute:NSLayoutAttributeRight
                              relatedBy:NSLayoutRelationEqual
                              toItem: self.view
                              attribute:NSLayoutAttributeRight
                              multiplier:1
                              constant:0.0]];
    
    //7. Toolbar height is fixed
        [toolbar addConstraint:[NSLayoutConstraint
                              constraintWithItem: toolbar
                              attribute:NSLayoutAttributeHeight
                              relatedBy:NSLayoutRelationEqual
                              toItem: nil
                              attribute:NSLayoutAttributeWidth
                              multiplier:1
                              constant: TOOLBAR_HEIGHT]];
    
    
    //8. Toolbar bottom is equal to view's bottom margin
        [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem: toolbar
                              attribute:NSLayoutAttributeBottom
                              relatedBy:NSLayoutRelationEqual
                              toItem: self.view
                              attribute:NSLayoutAttributeBottomMargin
                              multiplier:1
                              constant: 0]];
    
    
    // that's it
    
    
    [self.view setNeedsUpdateConstraints];
    [toolbar setNeedsUpdateConstraints];
    [textView setNeedsUpdateConstraints];
}

-(IBAction) onAccept: (id) sender
{
    [self.presentingViewController dismissViewControllerAnimated:true completion: nil];
}

-(IBAction) onReject: (id) sender
{
    exit( 0 );
}






@end

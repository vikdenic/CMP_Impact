//
//  SettingsViewController.m
//  CMP_Impact
//
//  Created by Vik Denic on 7/6/15.
//  Copyright (c) 2015 Vik Denic. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property Profile *profile;
@property (strong, nonatomic) IBOutlet PFImageView *profileImageView;

@end

@implementation SettingsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.profile = [UniversalProfile sharedInstance].profile;
}

- (IBAction)onSignOutTapped:(UIButton *)sender
{
    [User logOutInBackgroundWithBlock:^(NSError *error) {
        [self performSegueWithIdentifier:@"SignOutToLoginSegue" sender:self];
        [UniversalProfile sharedInstance].profile = nil;
        [self.navigationController popToRootViewControllerAnimated:YES];
        [self.tabBarController setSelectedIndex:0];
    }];
}

- (IBAction)onSaveButtonTapped:(UIBarButtonItem *)sender
{
    self.profile.fullName = self.nameTextField.text;
    [self.profile saveInBackgroundWithBlock:nil];
}
@end

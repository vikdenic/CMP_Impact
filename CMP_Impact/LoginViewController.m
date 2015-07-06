//
//  LoginViewController.m
//  CMP_Impact
//
//  Created by Vik Denic on 7/2/15.
//  Copyright (c) 2015 Vik Denic. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (strong, nonatomic) IBOutlet UITextField *usernameTextfield;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextfield;
@property (strong, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)onSegmentSelected:(UISegmentedControl *)sender
{
    if (sender.selectedSegmentIndex == 0)
    {
        [self.loginButton setTitle:@"Login" forState:UIControlStateNormal];
    }
    else
    {
        [self.loginButton setTitle:@"Sign Up" forState:UIControlStateNormal];
    }
}

- (IBAction)onLoginTapped:(UIButton *)sender
{
    if (self.segmentedControl.selectedSegmentIndex == 0)
    {
        [User logInWithUsernameInBackground:self.usernameTextfield.text password:self.passwordTextfield.text block:^(PFUser *user, NSError *error)
        {
            if (error == nil)
            {
                [Profile setProfileSingletonwithBlock:^(Profile *profile, NSError *error) {
                    [self dismissViewControllerAnimated:YES completion:nil];
                }];
            }
            else
            {
                //alert
            }
        }];
    }
    else
    {
        [User createUserWithUserName:self.usernameTextfield.text withPassword:self.passwordTextfield.text completion:^(BOOL result, NSError *error)
         {
             if (error == nil)
             {
                 Profile *newProfile = [[Profile alloc] initWithUser:[User currentUser]];

                 [newProfile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                     [self dismissViewControllerAnimated:YES completion:nil];
                 }];
             }
             else
             {
                 //alert
             }
         }];
    }
}

@end

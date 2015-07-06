//
//  ProfileViewController.m
//  CMP_Impact
//
//  Created by Vik Denic on 7/6/15.
//  Copyright (c) 2015 Vik Denic. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@property Profile *profile;

@end

@implementation ProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.profile = [UniversalProfile sharedInstance].profile;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationItem setTitle:self.profile.fullName];
}

@end

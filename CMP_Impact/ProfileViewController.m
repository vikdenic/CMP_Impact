//
//  ProfileViewController.m
//  CMP_Impact
//
//  Created by Vik Denic on 7/6/15.
//  Copyright (c) 2015 Vik Denic. All rights reserved.
//

#import "ProfileViewController.h"
#import "ProfileTableViewCell.h"
#import "StarredFilmTableViewCell.h"

@interface ProfileViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
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

#pragma mark - TableView

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        ProfileTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProfileCell"];
        cell.profileImageView.file = self.profile.imageFile;
        [cell.profileImageView loadInBackground];
        return cell;
    }
    else
    {
        StarredFilmTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FilmCell"];
        return cell;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

@end

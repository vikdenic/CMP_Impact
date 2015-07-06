//
//  FeedViewController.m
//  CMP_Impact
//
//  Created by Vik Denic on 7/5/15.
//  Copyright (c) 2015 Vik Denic. All rights reserved.
//

#import "FeedViewController.h"

@interface FeedViewController () <UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FeedViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self redirectNonUser];
}

-(void)redirectNonUser
{
    if ([User currentUser] == nil)
    {
        [self performSegueWithIdentifier:@"FeedToLoginSegue" sender:self];
    }
}

#pragma mark - tableView

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FilmCell"];

    return cell;
}

@end

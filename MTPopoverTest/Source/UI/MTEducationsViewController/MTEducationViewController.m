//
//  MTEducationViewController.m
//  MTPopoverTest
//
//  Created by Mark Tezza on 13/03/16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "MTEducationViewController.h"

@interface MTEducationViewController ()

@end

@implementation MTEducationViewController

#pragma mark -
#pragma mark Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Setting Education";
    
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                              target:self
                                                                              action:@selector(actionDoneButton:)];
    self.navigationItem.rightBarButtonItem = doneItem;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.choisedIndexPath)
    {
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:self.choisedIndexPath];
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Actions

- (void)actionDoneButton:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (self.choisedIndexPath)
    {
        [[tableView cellForRowAtIndexPath:self.choisedIndexPath] setAccessoryType:UITableViewCellAccessoryNone];
    }
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    
    if (indexPath.row == MTEducationTypePrimary)
    {
        self.educationString = @"Primary education";
    }
    else if (indexPath.row == MTEducationTypeSecondary)
    {
        self.educationString = @"Secondary education";
    }
    else if (indexPath.row == MTEducationTypeHigher)
    {
        self.educationString = @"Higher education";
    }
    
    self.choisedIndexPath = indexPath;
    [self.delegate didFinishEditingEducation:self.educationString withIndexPath:indexPath];
}

@end

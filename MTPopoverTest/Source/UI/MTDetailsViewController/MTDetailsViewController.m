//
//  MTDetailsViewController.m
//  MTPopoverTest
//
//  Created by Mark Tezza on 13/03/16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "MTDetailsViewController.h"

@interface MTDetailsViewController ()

@end

@implementation MTDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Info";
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                              target:self
                                                                              action:@selector(actionCancel:)];
    self.navigationItem.rightBarButtonItem = backItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    NSLog(@"Details dealocated");
}

#pragma mark -
#pragma mark Actions

- (void)actionCancel:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

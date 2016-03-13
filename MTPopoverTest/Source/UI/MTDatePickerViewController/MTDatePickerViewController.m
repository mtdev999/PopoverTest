//
//  MTDatePickerViewController.m
//  MTPopoverTest
//
//  Created by Mark Tezza on 13/03/16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "MTDatePickerViewController.h"

@interface MTDatePickerViewController ()

@end

@implementation MTDatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Setting Date";
    
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                target:self
                                                                                action:@selector(actionCancel:)];
    self.navigationItem.rightBarButtonItem = doneItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    NSLog(@"date picker dealocated");
}

#pragma mark -
#pragma mark Actions

- (void)actionCancel:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)actionDateDidChange:(UIDatePicker *)sender {
   [self.delegate didFinishEditingDate:sender.date];
    self.birthdayDate = sender.date;
    
}
@end

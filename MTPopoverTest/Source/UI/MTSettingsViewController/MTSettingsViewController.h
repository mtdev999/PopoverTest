//
//  ViewController.h
//  MTPopoverTest
//
//  Created by Mark Tezza on 13/03/16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTSettingsViewController : UITableViewController
@property (strong, nonatomic) IBOutlet  UITextField     *nameField;
@property (strong, nonatomic) IBOutlet  UITextField     *surnameField;
@property (strong, nonatomic) IBOutlet  UITextField     *birthdayField;
@property (strong, nonatomic) IBOutlet  UITextField     *educationField;
@property (strong, nonatomic)           NSIndexPath     *educationIndexPath;

- (IBAction)actionInfo:(UIBarButtonItem *)sender;
- (IBAction)actionDidChangeText:(UITextField *)sender;

@end


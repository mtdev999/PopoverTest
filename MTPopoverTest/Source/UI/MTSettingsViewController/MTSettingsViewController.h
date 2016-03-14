//
//  ViewController.h
//  MTPopoverTest
//
//  Created by Mark Tezza on 13/03/16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTSettingsViewController : UITableViewController
@property (nonatomic, strong) IBOutlet  UITextField         *nameField;
@property (nonatomic, strong) IBOutlet  UITextField         *surnameField;
@property (nonatomic, strong) IBOutlet  UITextField         *birthdayField;
@property (nonatomic, strong) IBOutlet  UITextField         *educationField;
@property (strong, nonatomic) IBOutlet  UISegmentedControl  *genderControl;
@property (nonatomic, strong)           NSIndexPath         *educationIndexPath;


- (IBAction)actionInfo:(UIBarButtonItem *)sender;
- (IBAction)actionDidChangeText:(UITextField *)sender;
- (IBAction)actionRefreshButton:(UIBarButtonItem *)sender;

@end


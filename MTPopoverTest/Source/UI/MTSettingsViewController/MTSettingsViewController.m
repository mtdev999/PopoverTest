//
//  ViewController.m
//  MTPopoverTest
//
//  Created by Mark Tezza on 13/03/16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "MTSettingsViewController.h"

#import "MTDetailsViewController.h"
#import "MTDatePickerViewController.h"
#import "MTEducationViewController.h"

@interface MTSettingsViewController () <UITextFieldDelegate, MTDatePickerViewControllerDelegate,
                                                             MTEducationViewControllerDelegate>

@property (nonatomic, strong)   UITextField     *textField;
@property (nonatomic, strong)   NSDate          *birthday;

@end

@implementation MTSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Actions

- (IBAction)actionInfo:(UIBarButtonItem *)sender {
    [self showInfoPopoverControllerFromSender:sender];
    
}

- (IBAction)actionDidChangeText:(UITextField *)sender {
    NSLog(@"text field %@", sender.text);
}

- (void)showInfoPopoverControllerFromSender:(id)sender {
    MTDetailsViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"MTDetailsViewController"];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:dvc];
    
    navController.modalPresentationStyle = UIModalPresentationPopover;
    [self presentViewController:navController animated:YES completion:nil];
    
    UIPopoverPresentationController *popController = [navController popoverPresentationController];
    popController.permittedArrowDirections = UIPopoverArrowDirectionAny;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        popController.barButtonItem = sender;
    }
}

- (void)showDatePickerPopoverController {
    MTDatePickerViewController *dateViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MTDatePickerViewController"];
    dateViewController.delegate = self;
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:dateViewController];
    
    navController.modalPresentationStyle = UIModalPresentationPopover;
    [self presentViewController:navController animated:YES completion:nil];
    
    UIPopoverPresentationController *popController = [navController popoverPresentationController];
    popController.permittedArrowDirections = UIPopoverArrowDirectionRight;
    
    popController.sourceView = self.birthdayField;
    popController.sourceRect = CGRectMake(30, 50, 10, 10);
}

- (void)showEducationPopoverController {
    MTEducationViewController *evc = [self.storyboard instantiateViewControllerWithIdentifier:@"MTEducationViewController"];
    evc.delegate = self;
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:evc];
    navController.modalPresentationStyle = UIModalPresentationPopover;
    [self presentViewController:navController animated:YES completion:nil];
    
    UIPopoverPresentationController *popController = [navController popoverPresentationController];
    popController.permittedArrowDirections = UIPopoverArrowDirectionRight;

    popController.sourceView = self.educationField;
    popController.sourceRect = CGRectMake(30, 50, 10, 10);
}

#pragma mark -
#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([textField isEqual:self.nameField]) {
        [self.surnameField becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if ([textField isEqual:self.birthdayField]) {
        [self showDatePickerPopoverController];
        
        return NO;
    } else if ([textField isEqual:self.educationField]) {
        [self showEducationPopoverController];
        
        return NO;
    }
    
    return YES;
}

#pragma mark -
#pragma mark  MTDatePickerViewControllerDelegate

- (void)didFinishEditingDate:(NSDate *)date {
    self.birthday = date;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd.MM.yyyy"];
    
    self.birthdayField.text = [dateFormatter stringFromDate:date];
    
    [self.tableView reloadData];
}

#pragma mark -
#pragma mark MTEducationViewControllerDelegate

- (void)didFinishEditingEducation:(NSString*)education withIndexPath:(NSIndexPath *)indexPath {
    self.educationField.text = education;
    self.educationIndexPath = indexPath;
    
    [self.tableView reloadData];
}

@end

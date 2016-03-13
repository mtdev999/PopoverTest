//
//  ViewController.m
//  MTPopoverTest
//
//  Created by Mark Tezza on 13/03/16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "MTSettingsViewController.h"

#import "MTDetailsViewController.h"

@interface MTSettingsViewController () <UITextFieldDelegate>

@end

@implementation MTSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver:self
           selector:@selector(notificationTextDidBeginEditing:)
               name:UITextFieldTextDidBeginEditingNotification
             object:nil];
    
    [nc addObserver:self
           selector:@selector(notificationTextDidEndEditing:)
               name:UITextFieldTextDidEndEditingNotification
             object:nil];
    
    [nc addObserver:self
           selector:@selector(notificationTextDidChangeEditing:)
               name:UITextFieldTextDidChangeNotification
             object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark -
#pragma mark Actions

- (IBAction)actionInfo:(UIBarButtonItem *)sender {
    NSLog(@"action Info");
    
    MTDetailsViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"MTDetailsViewController"];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:dvc];
    
    navController.modalPresentationStyle = UIModalPresentationPopover;
    [self presentViewController:navController animated:YES completion:nil];
    
    UIPopoverPresentationController *popController = [navController popoverPresentationController];
    popController.permittedArrowDirections = UIPopoverArrowDirectionAny;
    popController.delegate = dvc.delegate;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        popController.barButtonItem = sender;
    }
}

- (IBAction)actionDidChangeText:(UITextField *)sender {
    
    NSLog(@"text field %@", sender.text);
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

#pragma mark -
#pragma mark Notifications

- (void)notificationTextDidBeginEditing:(NSNotification *)notification {
    NSLog(@"notification - TextDidBeginEditing");
}

- (void)notificationTextDidEndEditing:(NSNotification *)notification {
    NSLog(@"notification - TextDidEndEditing");
}

- (void)notificationTextDidChangeEditing:(NSNotification *)notification {
    NSLog(@"notification - TextDidChangeEditing");
}

@end

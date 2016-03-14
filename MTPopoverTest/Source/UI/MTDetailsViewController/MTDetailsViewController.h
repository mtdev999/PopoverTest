//
//  MTDetailsViewController.h
//  MTPopoverTest
//
//  Created by Mark Tezza on 13/03/16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MTDetailsViewControllerDelegate <NSObject>

@required
- (void)didFinishChangeInfo:(UILabel *)name
                    surname:(UILabel *)surname
                     gender:(UILabel *)gender
                   birthday:(UILabel *)date
                  education:(UILabel *)education;

@end

@interface MTDetailsViewController : UIViewController
@property (nonatomic, strong) id<MTDetailsViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UILabel *nameL;
@property (strong, nonatomic) IBOutlet UILabel *surnameL;
@property (strong, nonatomic) IBOutlet UILabel *genderL;
@property (strong, nonatomic) IBOutlet UILabel *birthdayDateL;
@property (strong, nonatomic) IBOutlet UILabel *educationL;

@end

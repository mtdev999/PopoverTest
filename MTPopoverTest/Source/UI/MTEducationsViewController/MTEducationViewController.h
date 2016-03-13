//
//  MTEducationViewController.h
//  MTPopoverTest
//
//  Created by Mark Tezza on 13/03/16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MTEducationType) {
    MTEducationTypePrimary,
    MTEducationTypeSecondary,
    MTEducationTypeHigher
};

@protocol MTEducationViewControllerDelegate <NSObject>
@property (nonatomic, assign) MTEducationType educationType;

@required
- (void)didFinishEditingEducation:(NSString*)education withIndexPath:(NSIndexPath *)indexPath;

@end

@interface MTEducationViewController : UITableViewController
@property (nonatomic, assign) id<MTEducationViewControllerDelegate> delegate;

@property (strong, nonatomic) NSIndexPath   *choisedIndexPath;
@property (strong, nonatomic) NSString      *educationString;

@end

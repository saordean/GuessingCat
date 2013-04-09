//
//  GuessingCatViewController.h
//
//  Created by JerryTaylorKendrick on 3/27/13.
//  Copyright (c) 2013 Jerry Taylor Kendrick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Play.h"

@interface GuessingCatViewController : UIViewController<UIAlertViewDelegate, UITableViewDataSource>

@property (strong,nonatomic) IBOutletCollection(UIButton) NSArray *gameButtons;
@property (strong,nonatomic) IBOutletCollection(UIImageView) NSArray *kittyImageArray;
@property (strong,nonatomic) IBOutlet UIImageView *kittyImage;

// Added to get highest score in play
- (IBAction)anyButtonClicked:(UIButton *)sender;
- (IBAction)didRequestRanksButton:(id)sender;

// Added to allow for swiping
@property (nonatomic, strong) UISwipeGestureRecognizer *swipeRanksLeft;
@property (nonatomic, strong) UISwipeGestureRecognizer *swipeRanksRight;
- (IBAction) handleRanksSwipes:(UIGestureRecognizer *) sender;

@end
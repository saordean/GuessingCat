//
//  GuessingCatViewController.h
//
//  Created by JerryTaylorKendrick on 3/27/13.
//  Copyright (c) 2013 Jerry Taylor Kendrick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Play.h"

@interface GuessingCatViewController : UIViewController<UIAlertViewDelegate>

@property (strong,nonatomic) IBOutlet UILabel* gameTitleLabel;

@property (strong,nonatomic) IBOutletCollection(UIButton) NSArray *gameButtons;
@property (strong,nonatomic) IBOutletCollection(UIImageView) NSArray *kittyImageArray;
@property (strong,nonatomic) IBOutlet UIImageView *kittyImage;

// Number of wins per game
@property (nonatomic) NSInteger numberOfWins;


@end
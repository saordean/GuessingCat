//
//  GuessingCatViewController.h
//  GuessingCat
//
//  Created by JerryTaylorKendrick on 3/27/13.
//  Copyright (c) 2013 Jerry Taylor Kendrick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuessingCatViewController : UIViewController


@property (strong,nonatomic) IBOutlet UILabel* gameTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *kittyImageView;


-(IBAction) playAgainButton:(id) sender;

-(IBAction) anyButtonClicked:(id) sender;



@end
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

//-(IBAction) oneButton:(id) sender;
//-(IBAction) twoButton:(id) sender;
//-(IBAction) threeButton:(id) sender;
//-(IBAction) fourButton:(id) sender;
//-(IBAction) fiveButton:(id) sender;
//-(IBAction) sixButton:(id) sender;
//-(IBAction) sevenButton:(id) sender;
//-(IBAction) eightButton:(id) sender;
//-(IBAction) nineButton:(id) sender;

-(IBAction) playAgainButton:(id) sender;

-(IBAction) anyButtonClicked:(id) sender;

@end


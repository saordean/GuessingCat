//
//  GuessingCatViewController.h
//  GuessingCat
//
//  Created by JerryTaylorKendrick on 3/27/13.
//  Copyright (c) 2013 Jerry Taylor Kendrick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuessingCatViewController : UIViewController

-(IBAction) oneButton:(id) sender;
-(IBAction) twoButton:(id) sender;
-(IBAction) threeButton:(id) sender;
-(IBAction) fourButton:(id) sender;
-(IBAction) fiveButton:(id) sender;
-(IBAction) sixButton:(id) sender;
-(IBAction) sevenButton:(id) sender;
-(IBAction) eightButton:(id) sender;
-(IBAction) nineButton:(id) sender;
-(IBAction) playAgainButton:(id) sender;

@end

// Application wide variables

// Number selected by the player
NSInteger numberChosen;

// Number of guesses per game (restricted to 4 number key presses per game)
NSInteger numberToBeGuessed;

// Boolean indicator of whether the Play Again button was pressed
BOOL playAgain;

// Integer value of number of guesses per game
NSInteger guessesPerGame;
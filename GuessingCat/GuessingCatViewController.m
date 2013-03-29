//
//  GuessingCatViewController.m
//  GuessingCat
//
//  Created by JerryTaylorKendrick on 3/27/13.
//  Copyright (c) 2013 Jerry Taylor Kendrick. All rights reserved.
//

#import "GuessingCatViewController.h"
#import <Security/SecRandom.h>

@interface GuessingCatViewController ()

@end


@implementation GuessingCatViewController

@synthesize gameTitleLabel;



// Application wide variables

// Number selected by the player
NSInteger numberChosen;

// The number of attempts per game is restricted to 4 number key presses per game
NSInteger numberOfAttempts;

// The number of losses across play
NSInteger numberOfLosses;

// The value below is the value to be guessed for a given key press and is set by the randowm number generator
NSInteger correctNumber = 0;

// Numnber of wins
NSInteger numberOfWins;


// Name for wich png file to use when displaying wins
NSString *pngName;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(IBAction) playAgainButton:(id) sender
{
    GuessingCatViewController* view;
    view = [GuessingCatViewController alloc];

    numberOfAttempts = 0;
    numberOfLosses = 0;
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"overLossLimit"];
    gameTitleLabel.text = @"Guessing Cat Game";
    
    [self presentViewController:view
       animated:YES completion:Nil];
}


// Using interface builder to create the buttons, simply point them at the same IBAction in the relevant class.
//You can then differentiate between the buttons within the IBAction method by reading the text from the button
- (IBAction)anyButtonClicked:(id)sender {
    GuessingCatViewController* view;
    view = [GuessingCatViewController alloc];
    
    // Increment the number of attempts counter
    ++numberOfAttempts;
    NSLog(@"Button pressed: %@", [sender currentTitle]);
    if ([[sender currentTitle] isEqualToString:@"1"]) {
        // one
        numberChosen = 1;
    } else if ([[sender currentTitle] isEqualToString:@"2"]){
        // two
        numberChosen = 2;
    } else if ([[sender currentTitle] isEqualToString:@"3"]){
        // three
        numberChosen = 3;
    } else if ([[sender currentTitle] isEqualToString:@"4"]){
        // four
        numberChosen = 4;
    } else if ([[sender currentTitle] isEqualToString:@"5"]){
        // five
        numberChosen = 5;
    } else if ([[sender currentTitle] isEqualToString:@"6"]){
        // six
        numberChosen = 6;
    } else if ([[sender currentTitle] isEqualToString:@"7"]){
        // seven
        numberChosen = 7;
    } else if([[sender currentTitle] isEqualToString:@"8"]){
        // eight
        numberChosen = 8;
    } else if ([[sender currentTitle] isEqualToString:@"9"]){
        //nine
        numberChosen = 9;
    }
    
    correctNumber = [GuessingCatViewController randomInRangeLo: 1 toHi: 9];
    NSLog(@"Correct number: %d", correctNumber);
    // If the number chosen is not equal to the random number to be guessed for this play
    // take all actions associated with a failing attempt:
    NSLog(@"Number of attempts: %d", numberOfAttempts);
    if (numberOfAttempts < 5 && numberOfLosses < 4){
        if (numberChosen == correctNumber) {
                ++numberOfWins;
                // Put Happy cat on screen
                gameTitleLabel.text = @"You won Guessing cat Game";
            if (numberOfWins == 1){
                pngName = @"oneCat.png";
            } else if (numberOfWins == 2){
                pngName = @"twoCats.png";
            } else if (numberOfWins == 3) {
                pngName = @"threeCats.png";
            }
            UIImage *kitty = [UIImage imageNamed:pngName];
            [_kittyImageView setImage:kitty];
            
        } else {
                // Hide the button:
                // Buttons can be hidden and unhidden programmatically by adding "[buttonName setHidden: TRUE];" without
                // quotation marks to your code. Replace "buttonName" with the title of your button.
                // Use "TRUE" to hide the button or "FALSE" to unhide it.
                UIButton *tmp = (UIButton *)sender;
                tmp.hidden = YES;
                [UIImage imageNamed:@"mocha.png"];
        }
    }
    if (numberOfAttempts == 4 && numberOfLosses == 4) {
        // Lock the game
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"overLossLimit"];
    }
}

// Random number generator method
+ (u_int32_t)randomInRangeLo:(u_int32_t)loBound toHi:(u_int32_t)hiBound
{
    u_int32_t range = hiBound - loBound + 1;
    return loBound + arc4random_uniform(range);
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //[self.fullSizeImage setBackgroundImage:[UIImage imageNamed:@"button.png"] forState:UIControlStateNormal];
    //[self.fullSizeImage setBackgroundImage:[UIImage imageNamed:@"buttonHighlighted.png"] forState:UIControlStateHighlighted];

    //---    Initialize a new game    ---
    
    // Initialize the variables used to track number of attemspt and number of games
    numberOfAttempts = 0;
    
    
    
    // Check the global stored value for the losslimit flag, lock the user out if it is set
    //UIImage *kitty = [UIImage imageNamed:@"threeCats.png"];
    //[_kittyImageView setImage:kitty];
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"overLossLimit"]){
        // Display
        gameTitleLabel.text = @"Guessing Cat Game - DISABLED";
    }
                   
}

         
- (void)didReceiveMemoryWarning
{

    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

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

// Game end image
UIImageView *gameEnd;

// Game end frame = currentBrick.frame
//?????? *gameEndframe ;

// Create a frame timer
NSTimer *frameTimer;

// Array to hold the IDs of buttons that have been hidden
NSMutableArray *hiddenButtonArray;

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

// Global win count
Boolean globalWinCount;

// Boolean value for whether the game is locked or not
Boolean gameLocked;

// Name for an array holding png file names to be used when displaying wins
NSMutableArray *pngNameArray;

// Index value for the array holding png file names
NSInteger imageIndex;


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
    
    // Generate a new number to be guessed
    correctNumber = [GuessingCatViewController randomInRangeLo: 1 toHi: 9];
    
    // Reset the game display
    [self presentViewController:view animated:YES completion:Nil];
    
    if (!gameLocked){
        gameTitleLabel.text = @"Guessing Cat Game";
    } else {
        gameTitleLabel.text = @"You have had four losses, the game is now LOCKED";
    }
}


- (IBAction)anyButtonClicked:(id)sender {
    GuessingCatViewController* view;
    
    
    view = [GuessingCatViewController alloc];
    
    // Reset the gameTitleLabel label to hide the notification of any previous win
    gameTitleLabel.text = @"Guessing Cat Game";
    
    // Increment the number of attempts counter
    ++numberOfAttempts;
    
    NSLog(@"___________%d______________", numberOfAttempts);
    NSLog(@"Correct number: %d", correctNumber);
    numberChosen = [[sender currentTitle] intValue];
    NSLog(@"Number chosen: %d", numberChosen);
    NSLog(@"Number of attempts: %d", numberOfAttempts);
    NSLog(@"Number of wins: %d", numberOfWins);
    NSLog(@"___________%d______________", numberOfAttempts);
          
    // If the game isn't locked, number of guesses < 4 and number of losses < 4, proceed
    if    (!gameLocked
           && numberOfAttempts < 5
           && numberOfLosses   < 4)
    {
        // The number chosen is equal to the number generated take action for a win attempt
        if (numberChosen == correctNumber) {
            // Get the current value of the number of wins
            numberOfWins = [[NSUserDefaults standardUserDefaults] integerForKey:@"integerKey"];
            
            // Increment the number of wins value
            if (numberOfWins >=3) {
                numberOfWins = 3;
            } else {
                ++numberOfWins;
            }
            
            // Increment the global valure
            [[NSUserDefaults standardUserDefaults] setInteger:numberOfWins forKey:@"integerKey"];;
            
            if (numberOfWins == 3){
                gameTitleLabel.text = @"GAME OVER! Congratulations!";
            }
            
            //  Show an image of how many wins have happened
            imageIndex = numberOfWins-1;
            UIImage *kitty = [UIImage imageNamed:[pngNameArray objectAtIndex:imageIndex]];
            [_kittyImageView setImage:kitty];
            
            // Show previously hidden buttons
            [ GuessingCatViewController showHiddenButtons];
            
            // Reset the number of attempts after a win
            numberOfAttempts = 0;
            
            // Reset the number of losses after a win
            numberOfLosses = 0;
            
            //[self.view addSubview:gameEnd];
            //sleep(5);
            //frameTimer = [NSTimer timerWithTimeInterval:10 target:self //selector:@selector(changeImage) userInfo:nil repeats:true];
            //[self.view Subview:gameEnd];
    
            gameTitleLabel.text = @"You have correctly guessed the number and won a play!";
            
        } else {
            // The number chosen is not equal to the number generated, take action for failed attempt
    
            // Hide the last button pressed
            UIButton *tmp = (UIButton *)sender;
            tmp.hidden = YES;
            
            // Add the ID of the button just hidden to the hidden button array
            [hiddenButtonArray addObject:(UIButton *) sender];
            
            //[UIImage imageNamed:@"mocha.png"];
            
            // If the number of attempts is 4, there have been 4 failed attempts, record a loss
            if (numberOfAttempts == 4) {
                ++numberOfLosses;
                // Reset the number of attempts
                numberOfAttempts = 0;
                // [self presentViewController:view animated:YES completion:Nil];
                gameTitleLabel.text = @"You have lost a play of the game.";
                [GuessingCatViewController showHiddenButtons];
            }
        }
        
        if (numberOfLosses == 4) {
            // Lock the game
            //[[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"overLossLimit"];
            gameTitleLabel.text = @"You had too many losses and the game is LOCKED";
        }
    }
}

// Method to show buttons that previously been hidden (UIButton IDs stored in hiddenButtonArray
+ (void) showHiddenButtons
{
   // Reset the hidden buttons after a win
   for (int i=0; i < [hiddenButtonArray count]; i++) {
       UIButton *tmp = [hiddenButtonArray objectAtIndex:i];
       // unhide the button
       tmp.hidden = NO;
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

    //---    Initialize the after a program restart game    ---
    
    // Set up end of game image
    
    gameEnd = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Mocha.png"]];
//    gameEndframe = currentBrick.frame;
    
    // Set the initial value to be guessed
    correctNumber = [GuessingCatViewController randomInRangeLo: 1 toHi: 9];
    
    // Initialize the variable used to track number of attempts
    numberOfAttempts = 0;
    
    //numberOfWins = 0;
    //[[NSUserDefaults standardUserDefaults] setInteger:numberOfWins forKey:@"integerKey"];;
    
    // Get the global across restart stored numberOfWins value
    numberOfWins = [[NSUserDefaults standardUserDefaults] integerForKey:@"integerKey"];
    
    // Initialzie the array holding the pointers to names of win count image files
    pngNameArray = [[NSMutableArray alloc] init];
    [pngNameArray addObject:@"oneCat.png"];
    [pngNameArray addObject:@"twoCats.png"];
    [pngNameArray addObject:@"threeCats.png"];
    
    // Initialize the hidden button array
    hiddenButtonArray = [[NSMutableArray alloc] init];
    
    // Check the global stored value for losslimit flag, lock the user out if it is set
        gameLocked = [[NSUserDefaults standardUserDefaults] boolForKey:@"overLossLimit"];
    if (gameLocked){
        // Display "Guessing Cat Game - DISABLED" message
        gameTitleLabel.text = @"Guessing Cat Game - DISABLED";
        //numberOfWins = 0;
        //[[NSUserDefaults standardUserDefaults] setInteger:numberOfWins forKey:@"integerKey"];;
    }
}


- (void)didReceiveMemoryWarning
{

    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

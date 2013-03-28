//
//  GuessingCatViewController.m
//  GuessingCat
//
//  Created by JerryTaylorKendrick on 3/27/13.
//  Copyright (c) 2013 Jerry Taylor Kendrick. All rights reserved.
//

#import "GuessingCatViewController.h"
//#import <Security/SecRandom.h>

@interface GuessingCatViewController ()

@end

@implementation GuessingCatViewController



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
    
    playAgain = YES;
    
    
    [self presentViewController:view
       animated:YES completion:Nil];
}

-(IBAction) oneButton:(id) sender
{
    GuessingCatViewController* view;
    view = [GuessingCatViewController alloc];
    
    numberChosen = 1;
    ++guessesPerGame;
    
    [self presentViewController:view
                       animated:YES completion:Nil];
}

-(IBAction) twoButton:(id) sender
{
    GuessingCatViewController* view;
    view = [GuessingCatViewController alloc];
    
    numberChosen = 2;
    ++guessesPerGame;
    
    [self presentViewController:view
                       animated:YES completion:Nil];
}

-(IBAction) threeButton:(id) sender
{
    GuessingCatViewController* view;
    view = [GuessingCatViewController alloc];
    
    numberChosen = 3;
    ++guessesPerGame;
    [self presentViewController:view
                       animated:YES completion:Nil];
}

-(IBAction) fourButton:(id) sender
{
    GuessingCatViewController* view;
    view = [GuessingCatViewController alloc];
    
    numberChosen = 4;
    ++guessesPerGame;
    
    [self presentViewController:view
                       animated:YES completion:Nil];
}

-(IBAction) fiveButton:(id) sender
{
    GuessingCatViewController* view;
    view = [GuessingCatViewController alloc];
    
    numberChosen = 5;
    //++guessesPerGame;
    
    [self presentViewController:view
                       animated:YES completion:Nil];
}

-(IBAction) sixButton:(id) sender
{
    GuessingCatViewController* view;
    view = [GuessingCatViewController alloc];
    
    numberChosen = 6;
    ++guessesPerGame;
    
    [self presentViewController:view
                       animated:YES completion:Nil];
}

-(IBAction) sevenButton:(id) sender
{
    GuessingCatViewController* view;
    view = [GuessingCatViewController alloc];
    
    numberChosen = 7;
    ++guessesPerGame;

    
    [self presentViewController:view
                       animated:YES completion:Nil];
}

-(IBAction) eightButton:(id) sender
{
    GuessingCatViewController* view;
    view = [GuessingCatViewController alloc];
    
    numberChosen = 8;
    ++guessesPerGame;
    
    [self presentViewController:view
                       animated:YES completion:Nil];
}

-(IBAction) nineButton:(id) sender
{
    GuessingCatViewController* view;
    view = [GuessingCatViewController alloc];
    
    numberChosen = 9;
    ++guessesPerGame;
    
    [self presentViewController:view
                       animated:YES completion:Nil];
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
    

    // Initialize the "Play Again" value
    playAgain = NO;
    
    // initialize the first random number 
    numberToBeGuessed = [GuessingCatViewController randomInRangeLo: 1 toHi: 9];

}

- (void)didReceiveMemoryWarning
{

    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

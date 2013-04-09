//
//  GuessingCatViewController.m
//  GuessingCat
//
//  Created by JerryTaylorKendrick on 3/27/13.
//  Copyright (c) 2013 Jerry Taylor Kendrick. All rights reserved.
//

#import "GuessingCatViewController.h"
#import "RankViewController.h"
#import "Pick.h"


@interface GuessingCatViewController()
@property (nonatomic, strong) Play *play;
//@property (strong,nonatomic) UISwipeGestureRecognizer *oneFingerSwipeGestureDown;

@property (strong,nonatomic) NSString *tmp;
@end

@implementation GuessingCatViewController

-(void)viewWillAppear:(BOOL)animated{
    // add swipe gestures
//    self.oneFingerSwipeGestureDown = [[UISwipeGestureRecognizer alloc]
//                               initWithTarget:self
//                               action:@selector(oneFingerSwipeDownSelector:)];
//    [_oneFingerSwipeGestureDown setDirection:UISwipeGestureRecognizerDirectionDown];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // The following code is added to allow swipe recognition int the Guessingcat View Controller:
    //    - Right Swipe for next view (Score Ranks)
    //    - Left Swipe for previous view (Guessing Cat view if in Ranks View)
    //    - Up Swipe - no action
    //    - Down Swipt - no action
    
    self.swipeRanksLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleRanksSwipes:)];
    self.swipeRanksLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    // I think the line below accomplishes the same as above (?)
    //[_swipeRanksLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:self.swipeRanksLeft];
    
    self.swipeRanksRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleRanksSwipes:)];
    self.swipeRanksRight.direction = UISwipeGestureRecognizerDirectionRight;
    // I think the line below accomplishes the same as above (?)
    //[_swipeRanksRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:self.swipeRanksRight];
    
    self.play = [[Play alloc] init];
    self.play.maxPicks = 9;
    self.play.NumberOfWins = [[NSUserDefaults standardUserDefaults] integerForKey:@"wins"];
    self.play.maxAttempts = 4;
    self.play.maxWins = 3;
    [self.play startPlay];
    self.title = @"Guessing Cat Game";
}


-(void)updateUserInterface
{
    for (UIButton *gameButton in self.gameButtons) {
        Pick *pick = [self.play pickAtIndex:[self.gameButtons indexOfObject:gameButton]];
        //gameButton.titleLabel.text = [NSString stringWithFormat:@"%d", pick.value];
        [gameButton setHidden:!pick.isEnabled];
    }
    for (UIImageView *kittyView in self.kittyImageArray) {
        NSInteger kittyIndex = [self.kittyImageArray indexOfObject:kittyView];
        if( kittyIndex < (self.play.numberOfWins)){
            [kittyView setHidden:NO];
        }
    }
    [self.kittyImage setHidden:self.play.numberOfWins < 3];
}


-(IBAction)anyButtonClicked:(UIButton *)sender
{
    Pick *pick = [self.play pickAtIndex:[self.gameButtons indexOfObject:sender]];
   [self.play attempt:pick];
    if(self.play.isWinner){
        [self storeRank];
        [self displayVictoryMessage];
    }else{
        if (!self.play.canPlayAgain) {
            [self showAlertWithMessage:@"You are not prescient." title:@"Lost Game!" button:@"Try Again?"];
        }
    }
    [self updateUserInterface];
}


-(void)displayVictoryMessage{
    if(self.play.numberOfWins<self.play.maxWins){
        [self showAlertWithMessage:@"Congratulations, you've won the game!" title:@"Game Winner!" button:@"Play Again?"];
    }else{
        [self showAlertWithMessage:@"You are now done." title:@"Guessing Cat Victor!" button:@"OK"];
    }
}


-(void)showAlertWithMessage:(NSString *)message title:(NSString *)title button:(NSString *)button
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:button otherButtonTitles:nil, nil];
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self.play resetPlay];
    [self updateUserInterface];
}


-(void)storeRank
{
    NSMutableArray *ranks = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"ranks"] mutableCopy];
    if(!ranks) ranks = [[NSMutableArray alloc] init];
    [ranks addObject:[NSNumber numberWithDouble:self.play.span]];
    [[NSUserDefaults standardUserDefaults] setValue:ranks forKey:@"ranks"];
}


- (IBAction)didRequestRanksButton:(id)sender {
    RankViewController *rankViewController = [[RankViewController alloc]   initWithNibName:@"RankViewController"
        bundle:nil];
    [self.navigationController pushViewController:rankViewController animated:YES];
}


- (IBAction) handleRanksSwipes:(UIGestureRecognizer *) sender {
    UISwipeGestureRecognizerDirection direction = [(UISwipeGestureRecognizer *) sender direction];
    
    switch (direction) {
        case UISwipeGestureRecognizerDirectionUp:
            NSLog(@"up");
            break;
        case UISwipeGestureRecognizerDirectionDown:
            NSLog(@"down");
            break;
        case UISwipeGestureRecognizerDirectionLeft:
            NSLog(@"left");
            [self.navigationController popViewControllerAnimated:YES];
            break;
        case UISwipeGestureRecognizerDirectionRight:
            NSLog(@"right");
               RankViewController *rankViewController = [[RankViewController alloc]  initWithNibName:@"RankViewController"
                                                                                            bundle:nil];
            [self.navigationController pushViewController:rankViewController animated:YES];
            break;
    }
}


                                                       
- (void)didReceiveMemoryWarning
{

    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

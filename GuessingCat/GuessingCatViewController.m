//
//  GuessingCatViewController.m
//  GuessingCat
//
//  Created by JerryTaylorKendrick on 3/27/13.
//  Copyright (c) 2013 Jerry Taylor Kendrick. All rights reserved.
//

#import "GuessingCatViewController.h"
#import "RankViewController.h"
//#import "Pick.h"


@interface GuessingCatViewController()
@property (nonatomic, strong) Play *play;
@end

@implementation GuessingCatViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
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
        gameButton.titleLabel.text = [NSString stringWithFormat:@"%d", pick.value];
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
    RankViewController *rankViewController = [[RankViewController alloc] initWithNibName:@"RankViewController"
                                                                                        bundle:nil];
    [self.navigationController pushViewController:rankViewController animated:YES];
}


- (void)didReceiveMemoryWarning
{

    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

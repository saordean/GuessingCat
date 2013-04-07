//
//  Play.h
//  GuessingCat
//
//  Created by JerryTaylorKendrick on 4/2/13.
//  Copyright (c) 2013 Jerry Taylor Kendrick. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import "Pick.h"


@interface Play : NSObject

// ---------------- Application wide properties ----------------------------------
// Create a frame timer to determine how long the game end image is displayed
@property (nonatomic) NSTimer *frameTimer;
// The number of attempts per play (restricted to 4)
@property NSInteger numberOfAttempts;
// The number of wins per game
@property NSInteger numberOfWins;
// The number of losses per game
@property NSInteger numberOfLosses;
// Time of play
@property (nonatomic) NSTimeInterval span;
// Maximum number of wins
@property (nonatomic) NSInteger maxWins;
// Maximum number of Attempts
@property (nonatomic) NSInteger maxAttempts;
// Maximum number of Picks
@property (nonatomic) NSInteger maxPicks;
// Index of the Picks array
@property (nonatomic) NSInteger pickAtIndex;

// Array of button values
@property (nonatomic, strong) NSMutableArray *buttonArray;
// Array of picked values
//@property (nonatomic, strong) NSMutableArray *picks;

// Boolean indicator of whether the game can be played again
@property (nonatomic) BOOL canPlayAgain;
// Boolean indicator of whether the play is a win or not
@property (nonatomic) BOOL isWinner;
// --------------- Application wide properties---------------------------------

-(void)startPlay;
-(void)resetPlay;
-(void)attempt: (Pick *) pick;
-(void)initializePickWithAnswer:(NSInteger) answer;
-(id)initWithMaxPicks:(NSInteger) maxPicks;
-(Pick *) pickAtIndex:(NSUInteger) index;

@end

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
// The number of attempts per play (restricted to 4)
@property (nonatomic) NSInteger numberOfAttempts;
// The number of wins per game (<= 3)
@property (nonatomic) NSInteger numberOfWins;
// Span of time a play lasts
@property (nonatomic) NSTimeInterval span;
// Maximum number of wins
@property (nonatomic) NSInteger maxWins;
// Maximum number of Attempts
@property (nonatomic) NSInteger maxAttempts;
// Maximum number of values that can be picked
@property (nonatomic) NSInteger maxPicks;
// Index of the Picks array
@property (nonatomic) NSInteger pickAtIndex;

// Array of button values
//@property (nonatomic, strong) NSMutableArray *buttonArray;
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
-(Pick *) pickAtIndex:(NSUInteger) index;
//-(void)initializePickWithCorrectValue:(NSInteger) correctPick;

@end

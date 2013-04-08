//
//  Play.m
//  GuessingCat
//
//  Created by JerryTaylorKendrick on 4/2/13.
//  Copyright (c) 2013 Jerry Taylor Kendrick. All rights reserved.
//

#import "Play.h"

#define DEFAULT_MAX_PICKS 9

@interface Play()
@property (nonatomic) NSInteger correctPick;
@property (nonatomic) NSInteger attempts;
@property (nonatomic, strong) NSDate *beginTime;
@property (nonatomic, strong) NSMutableArray *picks;

-(void)initializePickWithCorrectValue:(NSInteger)correctPick;
@end

@implementation Play

-(NSMutableArray *)picks{
    if(!_picks) _picks = [[NSMutableArray alloc] init];
        return _picks;
}


- (id)initWithMaxPicks:(NSInteger)maxPicks
{
    self = [super init];
    if (self) {
        self.canPlayAgain = YES;
        self.maxPicks = maxPicks;;
        self.correctPick = [self randomInRangeLo:1 toHi: 9];
    }
    return self;
}


-(void)initializePickWithCorrectValue:(NSInteger)correctPick{
    [self.picks removeAllObjects];
    
    NSLog(@"%d", correctPick);
    for (int i = 1; i <= self.maxPicks; i++) {
        Pick *pick = [[Pick alloc] init];
        pick.value = i;
        pick.isEnabled = YES;
        pick.isCorrect = i == correctPick;
        [self.picks addObject:pick];
    }
}


-(void)setCorrectPick:(NSInteger)correctPick
{
    _correctPick = correctPick;
    [self initializePickWithCorrectValue:correctPick];
}


-(Pick *)pickAtIndex:(NSUInteger)index{
    return (index < [self.picks count]) ? self.picks[index] : nil;
}


-(void)attempt:(Pick *)pick {
    self.numberOfAttempts++;
    if(pick.isCorrect){
        self.numberOfWins++;
        self.isWinner = YES;
    
    }else{
        self.canPlayAgain = self.numberOfAttempts < self.maxAttempts;
        if(!self.canPlayAgain){
            [self.picks setValue:[NSNumber numberWithBool:NO] forKey:@"isEnabled"];
        }else{
            pick.isEnabled = NO;
        }
    }
}


-(void) startPlay
{
    self.canPlayAgain = YES;
    self.maxPicks = DEFAULT_MAX_PICKS;
    self.correctPick = [self randomInRangeLo:1 toHi:9];
    self.beginTime = [NSDate date];
}


-(void)resetPlay{
    if(self.numberOfWins < self.maxWins){
        self.numberOfAttempts = 0;
        self.isWinner = NO;
        [self initializePickWithCorrectValue:[self randomInRangeLo: 1 toHi:9]];
    }
    else{
        [self.picks setValue:[NSNumber numberWithBool:NO] forKey:@"isEnabled"];
    }
}


// Random number generator method
-(u_int32_t)randomInRangeLo:(u_int32_t)loBound toHi:(u_int32_t)hiBound
{
    u_int32_t range = hiBound - loBound + 1;
    return loBound + arc4random_uniform(range);
}


@end

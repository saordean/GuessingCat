//
//  Play.m
//  GuessingCat
//
//  Created by JerryTaylorKendrick on 4/2/13.
//  Copyright (c) 2013 Jerry Taylor Kendrick. All rights reserved.
//

#import "Play.h"

@interface Play()
@property (nonatomic, readwrite) NSInteger answer;
-(void)initializePickWithAnswer:(NSInteger)answer;
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
        self.maxPicks = maxPicks;
        self.answer = [self randomInRangeLo:1 toHi: 9];
    }
    return self;
}


-(void)initializePickWithAnswer:(NSInteger)answer{
    [self.picks removeAllObjects];
    NSLog(@"%d", answer);
    for (int i = 1; i <= self.maxPicks; i++) {
        Pick *pick = [[Pick alloc] init];
        pick.value = i;
        pick.isEnabled = YES;
        pick.isAnswer = i == answer;
        [self.picks addObject:pick];
    }
}


-(void)setAnswer:(NSInteger)answer
{
    _answer = answer;
    [self initializePickWithAnswer:answer];
}


-(Pick *)pickAtIndex:(NSUInteger)index{
    return (index < [self.picks count]) ? self.picks[index] : nil;
}


-(void)attempt:(Pick *)pick {
    self.numberOfAttempts++;
    if(pick.isAnswer){
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


-(void)resetPlay{
    if(self.numberOfWins < self.maxWins){
        self.numberOfAttempts = 0;
        self.isWinner = NO;
        [self initializePickWithAnswer:[self randomInRangeLo: 1 toHi:9]];
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
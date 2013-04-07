//
//  RankViewController.m
//  GuessingCat
//
//  Created by JerryTaylorKendrick on 4/7/13.
//  Copyright (c) 2013 Jerry Taylor Kendrick. All rights reserved.
//

#import "RankViewController.h"

@interface RankViewController ()
@property (nonatomic, strong) NSArray *ranks;
@end


@implementation RankViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Top Ranks";
    self.ranks = [[NSUserDefaults standardUserDefaults] arrayForKey:@"Ranks"];
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.ranks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    id time = self.ranks[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",time];
    return cell;
}


@end

//
//  RankViewController.h
//  GuessingCat
//
//  Created by JerryTaylorKendrick on 4/7/13.
//  Copyright (c) 2013 Jerry Taylor Kendrick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RankViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end

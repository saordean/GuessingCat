//
//  GuessingCatViewController.h
//  GuessingCat
//
//  Created by JerryTaylorKendrick on 3/27/13.
//  Copyright (c) 2013 Jerry Taylor Kendrick. All rights reserved.
//

#import <UIKit/UIKit.h>


// --- The public interface of the application ---

@interface GuessingCatViewController : UIViewController

// ---------------------Properties -----------------------------
@property (strong,nonatomic) IBOutlet UILabel* gameTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *kittyImageView;
//@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *secondKeyCollector;
// --------------------- Methods --------------------------------
-(IBAction) playAgainButton:(id) sender;

-(IBAction) anyButtonClicked:(id) sender;


//@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *secondKeyCollector;


@end
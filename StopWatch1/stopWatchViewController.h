//
//  stopWatchViewController.h
//  StopWatch1
//
//  Created by Student-003 on 21/07/16.
//  Copyright © 2016 Felix-ITs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface stopWatchViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *watch1;

@property (weak, nonatomic) IBOutlet UIButton *start;

- (IBAction)startWatch:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *reset;

- (IBAction)resetWatch:(id)sender;

@property(nonatomic,retain)NSTimer *timer1;

@property BOOL flag;

@property (nonatomic,retain)NSDate * startDate;

@end

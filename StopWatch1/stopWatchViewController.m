//
//  stopWatchViewController.m
//  StopWatch1
//
//  Created by Student-003 on 21/07/16.
//  Copyright © 2016 Felix-ITs. All rights reserved.
//

#import "stopWatchViewController.h"

@interface stopWatchViewController ()

//@property int timesec;
//@property int timemin;
//@property int timemili;

@end

@implementation stopWatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_start setTitle:@"START" forState:UIControlStateNormal];
    [_start addTarget:self action:@selector(startWatch:) forControlEvents:UIControlEventTouchUpInside];
    _startDate = [NSDate date];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)startWatch:(id)sender
{
    
    if(_flag==false)
    {
        _flag =true;
        _timer1 = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerTick:) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer1 forMode:NSDefaultRunLoopMode];
        [_start setTitle:@"STOP"forState:UIControlStateNormal];
    }
    else
    {
        [_timer1 invalidate];
        [_start setTitle:@"START"forState:UIControlStateNormal];
        _flag = false;
    }


}

- (void)timerTick:(NSTimer *)timer
{
    NSDate *currentDate = [NSDate date];
    NSTimeInterval timeInterval = [currentDate timeIntervalSinceDate:_startDate];
    NSDate *timerDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm:ss.SSS"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
    NSString *timeString=[dateFormatter stringFromDate:timerDate];
    _watch1.text = timeString;
    
    
//    
//    _timesec++;
//    if (_timesec == 60)
//    {
//        _timesec = 0;
//        _timemili = 0;
//        _timemin++;
//    }
//    //Format the string 00:00
//    NSString* timeNow = [NSString stringWithFormat:@"%02d:%02d:%02d", _timemili,_timemin, _timesec];
//    //Display on your label
//    //[timeLabel setStringValue:timeNow];
//    _watch1.text= timeNow;
//    
}

- (IBAction)resetWatch:(id)sender
{
    [_timer1 invalidate];
    _timer1 = nil;
    _startDate = [NSDate date];
    _watch1.text = @"00.00.00.000";
    _flag = FALSE;
    
//    _timesec = 0;
//    _timemin = 0;
//    _timemili = 0;
    //Since we reset here, and timerTick won't update your label again, we need to refresh it again.
    //Format the string in 00:00
    //NSString* timeNow = [NSString stringWithFormat:@"%02d:%02d:%02d", _timemili,_timemin, _timesec];
    //Display on your label
    // [timeLabel setStringValue:timeNow];

}
@end

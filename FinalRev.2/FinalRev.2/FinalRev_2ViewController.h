//
//  FinalRev_2ViewController.h
//  FinalRev.2
//
//  Created by Alex Chai on 11/15/12.
//  Copyright (c) 2012 Alex Chai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>
#import <StoreKit/StoreKit.h>
#import <StoreKit/StoreKit.h>

@interface FinalRev_2ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *TimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *DateLabel;
@property (strong, nonatomic) IBOutlet UILabel *calDates;
@property (strong, nonatomic) IBOutlet UILabel *calEvent0;
@property (strong, nonatomic) IBOutlet UILabel *calEvent1;
@property (strong, nonatomic) IBOutlet UILabel *calEvent2;
@property (strong, nonatomic) IBOutlet UILabel *calEvent3;
@property (strong, nonatomic) IBOutlet UILabel *calEvent4;
@property (weak, nonatomic) IBOutlet UILabel *calEvent5;
@property (weak, nonatomic) IBOutlet UILabel *calEvent6;
@property (weak, nonatomic) IBOutlet UILabel *calEvent7;
@property (weak, nonatomic) IBOutlet UILabel *calEvent8;


@property (strong, nonatomic) IBOutlet UILabel *eventToComeLabel;

//- (IBAction)Button:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *weekdaysLabel;


@end

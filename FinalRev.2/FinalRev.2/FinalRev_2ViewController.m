//
//  FinalRev_2ViewController.m
//  FinalRev.2
//
//  Created by Alex Chai on 11/15/12.
//  Copyright (c) 2012 Alex Chai. All rights reserved.
//  The silly NSLogs were to stick out just in case it comes off strangely
/*
 
 
 
BIG NOTE! THIS WILL STILL RUN AS ULTRACLOCK
 */

#import "FinalRev_2ViewController.h"


@interface FinalRev_2ViewController ()

@end

@implementation FinalRev_2ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self update];
    [self newInfo];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)update {
    
    //Random cut code
    
    //[current release];
    //NSUInteger weekdayIndex = dayOfWeek;
    //[self loadView];
    //[self viewDidLoad];
    //= [[EKEventStore alloc] initWithAccessToEntityTypes:EKEntityMaskEvent];
    // Get the appropriate calendar
    //NSCalendar *calendar = [NSCalendar currentCalendar];
    /*NSDateComponents *oneDayAgoComponents = [[NSDateComponents alloc] init];
     oneDayAgoComponents.day = -1;
     NSDateComponents *nowComponents;
     nowComponents.day = 0;
     NSDateComponents *laterComponents;
     laterComponents.day = 100;
     Create the end date components
     NSDateComponents *oneYearFromNowComponents = [[NSDateComponents alloc] init];
     oneYearFromNowComponents.year = 1;
     NSDate *oneYearFromNow = [calendar dateByAddingComponents:oneYearFromNowComponents
     toDate:[NSDate date]
     options:0];*/
    
    //The two updating timers
    NSTimer *updater;
    updater = [NSTimer scheduledTimerWithTimeInterval:(1) target:(self) selector:@selector(newTime) userInfo:nil repeats:YES];
    
    NSTimer *longUpdater;
    longUpdater = [NSTimer scheduledTimerWithTimeInterval:(1) target:(self) selector:@selector(newInfo) userInfo:nil repeats:YES];
    
    
    
    
    //GrabEvents
    
    
    
}

-(void)newInfo {
    
    //Fetching the current date and formatting it
    NSDate *current = [NSDate date];
    NSString *plainEng = [NSDateFormatter localizedStringFromDate:current
                                                        dateStyle:NSDateFormatterLongStyle
                                                        timeStyle:NSDateFormatterMediumStyle];
    
    NSLog(@"%@",plainEng);
    
    NSArray *dateArray = [plainEng componentsSeparatedByString:@" "];
    
    
    
    [self newTime];
    
    
    //Conditional to resolve an issue
    if ([dateArray count]==5) {
        
    //Changing the screen picture based on time
        [self setScreen12H:dateArray];
    }
    
    else if ([dateArray count]==4){
        [self setScreen24H:dateArray];
    }
    
    
    
    // NSLog(@"%@",finalTime);
    
    
    //if ([dateArray objectAtIndex:3]/4==)
    
    
    //Creating the string of days of the month for the calendar
    
    NSString *leapFebDays = @"28";
    
    if ([[[dateArray objectAtIndex:2] stringByReplacingOccurrencesOfString:@"," withString:@""] integerValue]%4==0){
        leapFebDays = @"29";
    }
    else {
        leapFebDays = @"28";
    }
    
    NSDictionary *months=[NSDictionary dictionaryWithObjectsAndKeys:
                          @"31",@"January",
                          leapFebDays,@"February",
                          @"31",@"March",
                          @"30",@"April",
                          @"31",@"May",
                          @"30",@"June",
                          @"31",@"July",
                          @"31",@"August",
                          @"30",@"September",
                          @"31",@"October",
                          @"30",@"November",
                          @"31",@"December",nil];
    
    
    
    NSString *dayString = [[dateArray objectAtIndex:1] stringByReplacingOccurrencesOfString:@"," withString:@""];
    NSLog(@"%@",dayString);
    int i = [dayString floatValue];
    int dayCount=i;
    //NSMutableArray *datesies;
    
    NSString *calDays;
    
    if ([[months objectForKey:[dateArray objectAtIndex:0]] integerValue]>9) {
        calDays=@"";
    }
    else {
        calDays=@" ";
    }
    
    for (int b = 0; b<10; b++) {
        // NSUInteger nsB = b;
        int endDays = [[months objectForKey:[dateArray objectAtIndex:0]] integerValue];
        int day;
        
        if (dayCount==endDays){
            day=dayCount;
            dayCount = (dayCount-endDays+1);
        }
        
        else {
            day=dayCount;
            dayCount = (dayCount+1);
        }
        
        
        NSString *dayString = [NSString stringWithFormat:@"%i",day];
        
        
        calDays = [calDays stringByAppendingString:dayString];
        NSLog(@"%u     %@",day,calDays);
        //[datesies insertObject:dayCount atIndex:(b)];
        
        if ((day>9)&&(day%2==0)) {
            calDays = [calDays stringByAppendingString:@"  "];}
        else if ((day>9)&&(day%2!=0)) {
            calDays = [calDays stringByAppendingString:@"  "];}
        else if (day==9) {
            calDays = [calDays stringByAppendingString:@"   "];
        }
        
        else {
            calDays = [calDays stringByAppendingString:@"    "];
        }
        
        if (b==7){
            break;
        }
        
        self.calDates.text = calDays;
        
    }
    
    //Determining the day of the week
    
    NSDateFormatter *dasFormatter;
    [dasFormatter setDateFormat:@"EEEE"];
    NSString *weekDay = [dasFormatter stringFromDate:current];
    
    NSUInteger dayOfWeek = [[[NSCalendar currentCalendar] components:NSWeekdayCalendarUnit fromDate:current] weekday];
    NSLog(@"intWAKAWAKA %i",dayOfWeek);
    NSArray *weekDays = [NSArray arrayWithObjects:@"Watermelon",@"SU",@"MO",@"TU",@"WE",@"TH",@"FR",@"SA",nil];
    
    NSString *weekdayString=[weekDays objectAtIndex:dayOfWeek];
    //NSString *weekdayString = @"BRAKEN";
    for (NSUInteger i=0;i<6;i++) {
        //weekdayIndex=weekdayIndex+1;
        
        NSUInteger daysSince = i;
        if (dayOfWeek+i<7) {
            daysSince = i;
        }
        else {
            daysSince = i-7;
        }
        weekdayString=[weekdayString stringByAppendingString:@" "];
        weekdayString=[weekdayString stringByAppendingString:[weekDays objectAtIndex:dayOfWeek+daysSince+1]];
        if (i==7){
            break;
        }
    }
    NSLog(@"NSWAKAWAKA %@",weekdayString);
    self.weekdaysLabel.text = weekdayString;
    
    
    
    
    //Setting up the array of Events
    
    EKEventStore *theEventStore = [[EKEventStore alloc] init];
    [theEventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error){
        
        if (granted) {
            NSLog(@"RISE  FOR THE GREAT CALENDAR HAS BEEN GRANTED");
            // self.eventToComeLabel.text = @"achbin";
        }
        else {
            // self.eventToComeLabel.text = @" ";
        }
    }];
    
    NSTimeInterval timeSinceCurrent = (86400000);
    NSDate *laterDate = [NSDate dateWithTimeInterval:timeSinceCurrent sinceDate:current];
    
    //NSCalendar *dasCalendar = [NSCalendar currentCalendar];
    
    NSPredicate *thePredicate = [theEventStore predicateForEventsWithStartDate:current
                                                                       endDate:laterDate
                                                                     calendars:nil];
    
    NSArray *EKevents = [theEventStore eventsMatchingPredicate:thePredicate];
    /*
     if ([events count]==1) {
     self.eventToComeLabel.text = @"Event to Come";
     }
     else if (([events count]==nil)) {
     self.eventToComeLabel.text =@" ";
     }*/
    
    //Turn the events into strings
    
    NSMutableArray *events = [[NSMutableArray alloc] init];
    
    
    for (NSUInteger z=0;z<10;z++) {
        if (z==[EKevents count]) {
            break;
        }
        
        EKEvent *individualEvent = [EKevents objectAtIndex:z];
        NSString *titleString = individualEvent.title;
        NSLog(@"TITLESTRING:%@",individualEvent.title);
        NSDate *startTime = individualEvent.startDate;
        NSString *eventEng = [NSDateFormatter localizedStringFromDate:startTime dateStyle:NSDateFormatterLongStyle timeStyle:NSDateFormatterShortStyle];
        NSArray *eventDateArray = [eventEng componentsSeparatedByString:@" "];
        NSString *eventStart = [eventDateArray objectAtIndex:3];
        NSString *finalString = [[titleString stringByAppendingString:@" - "] stringByAppendingString:eventStart];
        finalString = [[[[finalString stringByAppendingString:@" - "] stringByAppendingString:[eventDateArray objectAtIndex:0]] stringByAppendingString:@" "] stringByAppendingString:[eventDateArray objectAtIndex:1]];
        [events insertObject:finalString atIndex:z];
        NSLog(@"EVENT ARRAY TITLE: %@",[events objectAtIndex:z]);
        
        //self.eventToComeLabel.text = individualEvent.title;
    }
    
    NSLog(@"EVENTS COUNT STUFFIES: %i",[EKevents count]);
    
    //NSArray *emptyArray;
    //NSLog(@"BINKLEWINKLE %@",);
    
    if ([EKevents objectAtIndex:0]==NULL) {
        self.eventToComeLabel.text=@" ";
        
    }
    
    //Just to change the title of the event list for different numbers
    
    self.calEvent0.text = @" ";
    self.calEvent1.text = @" ";
    self.calEvent2.text = @" ";
    self.calEvent3.text = @" ";
    self.calEvent4.text = @" ";
    self.calEvent5.text = @" ";
    self.calEvent6.text = @" ";
    self.calEvent7.text = @" ";
    self.calEvent8.text = @" ";
    
    
    if ([events count]==0) {
        self.eventToComeLabel.text = @" ";
    }
    else if ([events count]==1) {
        self.eventToComeLabel.text = @"Event To Come";
    }
    else {
        self.eventToComeLabel.text = @"Events To Come";
    }
    
    if ([events count]>0) {
        self.calEvent0.text = [events objectAtIndex:0];
    }
    
    if ([events count]>1){
        self.calEvent1.text = [events objectAtIndex:1];
    }
    
    if ([events count]>2) {
        self.calEvent2.text = [events objectAtIndex:2];
    }
    
    if ([events count]>3){
        self.calEvent3.text = [events objectAtIndex:3];}
    
    if ([events count]>4){
        self.calEvent4.text = [events objectAtIndex:4];}
    
    if ([events count]>5){
        self.calEvent5.text = [events objectAtIndex:5];}
    
    if ([events count]>6){
        self.calEvent6.text = [events objectAtIndex:6];}
    
    if ([events count]>7){
        self.calEvent7.text = [events objectAtIndex:7];}
    
    if ([events count]>8){
        self.calEvent8.text = [events objectAtIndex:8];}
    }
   
    
    /*else {
        [self newInfo24H];
        self.DateLabel.text = @"Please Use A 12-Hour Clock";
        self.TimeLabel.text=@" ";    }*/
    
    


-(void)setScreen12H:(NSArray*)dateArray {
   
    
    // int bob=3;
    NSString *imageName = @"_MG_1702.jpg";
    NSString *timeHalf = [dateArray objectAtIndex:4];
    NSArray *hours = [[dateArray objectAtIndex:3] componentsSeparatedByString:@":"];
    int hourCount = [[hours objectAtIndex:0]integerValue];
    if (((hourCount>6)&&
         (hourCount<12)&&
         ([timeHalf hasPrefix:@"A"]==FALSE))||
        (((hourCount<6)||(hourCount>11))&&
         ([timeHalf hasPrefix:@"A"]==TRUE))) {
            imageName=@"_MG_1702.jpg";
            NSLog(@"ICH BEIN EIN BERLINER");
        }
    else {
        imageName=@"Ducks on a Misty Pond3.jpg";
    }
    
    NSLog(@"ERHMAHGERD%@",timeHalf);
    UIImage *backImage = [UIImage imageNamed:imageName];
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:backImage];
    if ([timeHalf hasPrefix:@"P"]==TRUE){
        NSLog(@"OH THE HUGH MANITEE");
    }
    
}

-(void)setScreen24H:(NSArray*)dateArray{
    
    NSString *imageName = @"_MG_1702.jpg";
    NSArray *hours = [[dateArray objectAtIndex:3] componentsSeparatedByString:@":"];
    int hourCount = [[hours objectAtIndex:0]integerValue];
    if ((hourCount>5)&&(hourCount<19)){
        imageName = @"Ducks on A Misty Pond3.jpg";
    }
    //NSLog(@"ERHMAHGERD%@",timeHalf);
    UIImage *backImage = [UIImage imageNamed:imageName];
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:backImage];
    
}

-(void)newTime {
    //Update the time and date
    NSDate *current = [NSDate date];
    NSString *plainEng = [NSDateFormatter localizedStringFromDate:current dateStyle:NSDateFormatterLongStyle timeStyle:NSDateFormatterMediumStyle];
    
    NSLog(@"%@",plainEng);
    //int fullDayClock;
    
    NSArray *dateArray = [plainEng componentsSeparatedByString:@" "];
    
    //Conditional to resolve an issue
    NSString *time = [dateArray objectAtIndex:3];
    NSString *finalTime = @"hi";
    if ([dateArray count]==5) {
    NSString *amPm = [dateArray objectAtIndex:4];
    finalTime = [[time stringByAppendingString:@" "]stringByAppendingString:amPm];
    }
    else{
    finalTime = time;
    }
    
    NSString *date = [dateArray objectAtIndex:1];
    NSString *month = [dateArray objectAtIndex:0];
    NSString *year = [dateArray objectAtIndex:2];
    NSString *finalDate = [[[[month stringByAppendingString:@" "]stringByAppendingString:date] stringByAppendingString:@" "] stringByAppendingString:year];
    
    self.TimeLabel.text = finalTime;
    self.DateLabel.text = finalDate;
    }





/*else {
        NSLog (@"NARM");
        self.DateLabel.text = @"Please Use A 12-Hour Clock";
        self.TimeLabel.text=@" "; */
  //  }
//}





//old button for update
- (IBAction)Button:(id)sender {
    [self update];
    
}
@end


//
//  EventsDetailsJSONModel.h
//  TechTatva '16
//
//  Created by Abhishek Vora on 02/08/16.
//  Copyright © 2016 YASH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventsDetailsJSONModel : NSObject

@property (strong,nonatomic) NSString *eventName;
@property (strong, nonatomic) NSString *eventId;
@property (strong, nonatomic) NSString *eventDescription;
@property (strong, nonatomic) NSString *eventMaxTeamSize;
@property (strong, nonatomic) NSString *categoryEventId;
@property (strong, nonatomic) NSString *categoryEventName;
@property (strong, nonatomic) NSString *cntctname;
@property (strong, nonatomic) NSString *cntctno;
@property (strong, nonatomic) NSString *hs1;
@property (strong, nonatomic) NSString *hs2;
@property (strong, nonatomic) NSString *day;

-(instancetype)initWithData:(id)myData;
+(NSMutableArray *)getArrayFromJson:(id)myData;

@end

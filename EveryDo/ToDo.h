//
//  ToDo.h
//  EveryDo
//
//  Created by Tyler Boudreau on 2018-04-24.
//  Copyright © 2018 Tyler Boudreau. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDo : NSObject
@property NSString * title;
@property NSString * toDoDescription;
@property NSInteger priority;
@property BOOL isComplete;

-(instancetype)initWithStuff:(NSString *)title :(NSString *)toDoDescription :(NSInteger) priority :(BOOL)isComplete;
@end

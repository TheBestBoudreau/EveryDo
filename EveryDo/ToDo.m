//
//  ToDo.m
//  EveryDo
//
//  Created by Tyler Boudreau on 2018-04-24.
//  Copyright © 2018 Tyler Boudreau. All rights reserved.
//

#import "ToDo.h"

@implementation ToDo

-(instancetype)initWithStuff:(NSString *)title :(NSString *)toDoDescription :(NSInteger) priority :(BOOL)isComplete
{
    self = [super init];
    if (self) {
        _title=title;
        _toDoDescription=toDoDescription;
        _priority=priority;
        _isComplete=isComplete;
    }
    return self;
}

@end

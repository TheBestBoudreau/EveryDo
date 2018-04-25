//
//  DetailedViewController.m
//  EveryDo
//
//  Created by Tyler Boudreau on 2018-04-24.
//  Copyright © 2018 Tyler Boudreau. All rights reserved.
//

#import "DetailedViewController.h"
@interface DetailedViewController ()
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;

@end

@implementation DetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.detailLabel setText:self.doStuff.toDoDescription];
    [self.priorityLabel setText:[@(self.doStuff.priority)stringValue]];
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

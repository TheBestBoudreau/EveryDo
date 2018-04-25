//
//  AddNewViewController.h
//  EveryDo
//
//  Created by Tyler Boudreau on 2018-04-24.
//  Copyright © 2018 Tyler Boudreau. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ToDo;

@protocol AddNewViewControllerDelegate
-(void)takeTask:(ToDo *)todo;

@end

@interface AddNewViewController : UIViewController
@property(nonatomic,weak)id<AddNewViewControllerDelegate>delegate;

@end

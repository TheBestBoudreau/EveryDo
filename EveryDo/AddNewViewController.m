//
//  AddNewViewController.m
//  EveryDo
//
//  Created by Tyler Boudreau on 2018-04-24.
//  Copyright © 2018 Tyler Boudreau. All rights reserved.
//

#import "AddNewViewController.h"
#import "ToDo.h"
@interface AddNewViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *taskTitleTextField;
@property (weak, nonatomic) IBOutlet UITextField *taskDetailTextField;
@property (weak, nonatomic) IBOutlet UITextField *taskPriorityTextField;

@end

@implementation AddNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _taskTitleTextField.placeholder=@"Task Name";
    _taskDetailTextField.placeholder=@"Details";
    _taskPriorityTextField.placeholder=@"Priority 1-100";
    
    self.taskTitleTextField.keyboardType=UIKeyboardTypeDefault;
    self.taskDetailTextField.keyboardType=UIKeyboardTypeDefault;
    self.taskPriorityTextField.keyboardType=UIKeyboardTypeNumberPad;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)submit:(id)sender {
    ToDo *todo =[[ToDo alloc] initWithStuff:self.taskTitleTextField.text :self.taskDetailTextField.text :self.taskPriorityTextField.text.integerValue :NO];
    
    [self.delegate takeTask:todo];
}






@end

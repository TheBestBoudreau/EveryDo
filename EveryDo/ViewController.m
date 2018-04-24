//
//  ViewController.m
//  EveryDo
//
//  Created by Tyler Boudreau on 2018-04-24.
//  Copyright © 2018 Tyler Boudreau. All rights reserved.
//

#import "ViewController.h"
#import "ToDo.h"
#import "ToDoTableViewCell.h"
#import "DetailedViewController.h"
@interface ViewController ()
@property NSMutableArray *taskyArray;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ToDo *task1 =[[ToDo alloc] initWithStuff:@"Bear" :@"Feed the bear" :2 :FALSE];
    ToDo *task2=[[ToDo alloc]initWithStuff:@"Garbage" :@"Dispose Body" :3 :FALSE];
    ToDo *task3=[[ToDo alloc]initWithStuff:@"Baby":@"Walk the baby":4 :true];
    ToDo *task4=[[ToDo alloc]initWithStuff:@"Clean" :@"Polish swords" :5 :true];
    ToDo *task5=[[ToDo alloc] initWithStuff:@"Car" :@"Plug bullet holes" :1 :false];
    
    _taskyArray = [[NSMutableArray alloc] initWithObjects:task1,task2,task3,task4,task5, nil];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.taskyArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ToDoTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"ToDocellid" forIndexPath:indexPath];
    ToDo *todo = [self.taskyArray objectAtIndex:indexPath.row];


    cell.titleView.text= todo.title;
    cell.descriptionView.text=todo.description;
    cell.priorityView.text=[@(todo.priority)stringValue];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"detailedVCid" sender:indexPath];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
}
@end

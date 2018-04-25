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
#import "AddNewViewController.h"
@interface ViewController () <AddNewViewControllerDelegate>
@property NSMutableArray *taskyArray;
@property NSMutableArray *completedArray;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ToDo *task1 =[[ToDo alloc] initWithStuff:@"Bear" :@"Feed the bear" :50 :FALSE];
    ToDo *task2=[[ToDo alloc]initWithStuff:@"Garbage" :@"Dispose Body" :75 :FALSE];
    ToDo *task3=[[ToDo alloc]initWithStuff:@"Baby":@"Walk the baby":20 :FALSE];
    ToDo *task4=[[ToDo alloc]initWithStuff:@"Clean" :@"Polish swords" :35 :FALSE];
    ToDo *task5=[[ToDo alloc] initWithStuff:@"Car" :@"Plug bullet holes" :100 :FALSE];
    
    _taskyArray = [[NSMutableArray alloc] initWithObjects:task1,task2,task3,task4,task5, nil];
    _completedArray=[[NSMutableArray alloc]init];
    
    UIBarButtonItem *addButton=[[UIBarButtonItem alloc]initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(add:)];
    
    self.navigationItem.rightBarButtonItem=addButton;
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    NSLog(@"Section: %ld", (long)section);
    if (section == 0){
        NSLog(@"Task Array: %ld", self.taskyArray.count);
        return self.taskyArray.count;
}else{
        NSLog(@"Comlpeted array: %ld", self.completedArray.count);
        return self.completedArray.count;
        
    }
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section ==0)
        return @"Incomplete";
    else
        return @"Complete";
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ToDo *todo;
    
    ToDoTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"ToDocellid" forIndexPath:indexPath];
    if (indexPath.section == 0){
        todo = [self.taskyArray objectAtIndex:indexPath.row]; }
    else{
        todo =[self.completedArray objectAtIndex:indexPath.row];
    }
    UISwipeGestureRecognizer*swipeLeft =[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipe:)];
    
    [cell addGestureRecognizer:swipeLeft];
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];

    cell.titleView.text= todo.title;
    cell.descriptionView.text=todo.toDoDescription;
    cell.priorityView.text=[@(todo.priority)stringValue];
    return cell;
}
-(void)swipe:(UISwipeGestureRecognizer *)sender{
    ToDoTableViewCell *cell = [ToDoTableViewCell new];
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft){
        NSLog(@"Swipe Left");
        [UIView animateWithDuration:0.5 animations:^{
            cell.frame= CGRectMake(cell.frame.origin.x +cell.frame.size.width /5, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);}];
    }
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete){
        [self.taskyArray removeObjectAtIndex:indexPath.row];
        [self.myTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"detailedVCid"]){
        DetailedViewController *dvc=[segue destinationViewController];
        
        ToDoTableViewCell *cell = (ToDoTableViewCell *)sender;
        NSIndexPath *indexPath = [self.myTableView indexPathForCell:cell];
    
        ToDo* todo = [self.taskyArray objectAtIndex:indexPath.row];
        
        dvc.doStuff= todo;
    }
    
    if ([segue.identifier isEqualToString:@"addNewid"]){
        AddNewViewController *anvc =[segue destinationViewController];
        anvc.delegate=self;
    }
    
}

-(void)add:(UIBarButtonItem *)sender{
    [self performSegueWithIdentifier:@"addNewid" sender:sender];
}

-(void)takeTask:(ToDo *)todo{
    [self.taskyArray addObject:todo];
    [self.myTableView reloadData];
}

- (nullable UISwipeActionsConfiguration *)tableView:(UITableView *)tableView leadingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        UIContextualAction *action = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleNormal title:@"Complete" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
            
            ToDo *todo= [self.taskyArray objectAtIndex:indexPath.row];
            [self.completedArray addObject:todo];
            [self.taskyArray removeObjectAtIndex:indexPath.row];
            [self.myTableView reloadData];
        }];
        UISwipeActionsConfiguration *config = [UISwipeActionsConfiguration configurationWithActions:@[action]];
        
        NSLog(@"Hitting here");
        return config;
    }
    
    return NULL;
    
}

@end

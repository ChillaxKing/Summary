//
//  LGGKnowledgeTableViewController.m
//  Summery
//
//  Created by 路岗 on 2018/11/14.
//  Copyright © 2018年 Gang. All rights reserved.
//

#import "LGGKnowledgeTableViewController.h"

static NSString *const kcellIdentifier = @"KNOWLEDGECELLIDENTIFIER";
@interface LGGKnowledgeTableViewController ()
@property(nonatomic,strong)NSArray *tableSections;


@end

@implementation LGGKnowledgeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kcellIdentifier] ;
    self.tableSections = [[LGGKnowledgeModelManager shareManager]sectionKeysArray];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.tableSections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *submodels = [[LGGKnowledgeModelManager shareManager]subArrayWithClassifyKey:self.tableSections[section]];
    return submodels.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kcellIdentifier forIndexPath:indexPath];
    NSArray *submodels = [[LGGKnowledgeModelManager shareManager]subArrayWithClassifyKey:self.tableSections[indexPath.section]];
    LGGKnowledgeClassifyModel *cellModel = submodels[indexPath.row];
    // Configure the cell...
    cell.textLabel.text = cellModel.title;
    
    return cell;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return self.tableSections[section];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *key = self.tableSections[indexPath.section];
    LGGKnowledgeClassifyModel *cellModel = [[[LGGKnowledgeModelManager shareManager]subArrayWithClassifyKey:key]objectAtIndex:indexPath.row]; 
    if (cellModel.className != nil) {
        
        id viewcontroller;
        viewcontroller = [[NSClassFromString(cellModel.className)alloc]init];
        if (self.navigationController.childViewControllers.count >= 1) {
            self.navigationController.hidesBottomBarWhenPushed = YES;
        }
        [self.navigationController pushViewController:viewcontroller animated:YES];
    }
    
}
@end

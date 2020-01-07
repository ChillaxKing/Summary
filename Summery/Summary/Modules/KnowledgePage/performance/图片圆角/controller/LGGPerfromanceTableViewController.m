//
//  LGGPerfromanceTableViewController.m
//  Summary
//
//  Created by 路岗 on 2019/2/13.
//  Copyright © 2019年 Gang. All rights reserved.
//
#import "LGGRoundImageRenderTableViewCell.h"
#import "LGGRoundImageRenderTableViewCell+load.h"
#import "LGGPerfromanceTableViewController.h"


static NSString *const kcellIdentifier = @"PERFORMANCECELL";
static NSString *const kRoundImageRenderCell = @"LGGRoundImageRenderTableViewCell.xib";

@interface LGGPerfromanceTableViewController ()


@end

@implementation LGGPerfromanceTableViewController
+(void)load{

    LGGKnowledgeClassifyModel *model = [[LGGKnowledgeClassifyModel alloc]initWithSuperClassify:@"performance" withTitle:@"性能优化" withClassName:@"LGGPerfromanceTableViewController"];
    [[LGGKnowledgeModelManager shareManager]addModel:model];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.tableView registerNib:[UINib nibWithNibName:@"LGGRoundImageRenderTableViewCell" bundle:nil]] forCellReuseIdentifier:kRoundImageRenderCell];
    [self.tableView registerNib:[UINib nibWithNibName:@"LGGRoundImageRenderTableViewCell" bundle:nil] forCellReuseIdentifier:kRoundImageRenderCell];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LGGRoundImageRenderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kRoundImageRenderCell forIndexPath:indexPath];
    DLog(@"复用机制%p",cell);
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
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

@end

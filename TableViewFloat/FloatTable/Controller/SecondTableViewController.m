//
//  SecondTableViewController.m
//  TableViewFloat
//
//  Created by 李雪阳 on 2018/8/28.
//  Copyright © 2018年 singularity. All rights reserved.
//

#import "SecondTableViewController.h"
#import "FloatRankCell.h"
#import "NewSkipViewController.h"

@interface SecondTableViewController ()

@end

@implementation SecondTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (!self.vcCanScroll) {
        scrollView.contentOffset = CGPointZero;
    }
    if (scrollView.contentOffset.y <= 0) {
        self.vcCanScroll = NO;
        scrollView.contentOffset = CGPointZero;
        //到顶通知父视图改变状态
        [[NSNotificationCenter defaultCenter] postNotificationName:@"leaveTop" object:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FloatRankCell *cell = [tableView dequeueReusableCellWithIdentifier:@"rank"];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"FloatRankCell" owner:self options:nil]lastObject];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 49;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [_VC.navigationController pushViewController:[NewSkipViewController new] animated:YES];
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

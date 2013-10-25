//
//  FirstLevelViewController.m
//  Nav
//
//  Created by Elisha on 11. 5. 10..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FirstLevelViewController.h"
#import "SecondLevelViewController.h"
#import "DisclosureButtonController.h"
#import "CheckListController.h"
#import "RowControlsController.h"
#import "MoveMeController.h"
#import "DeleteMeController.h"
#import "PresidentsViewController.h"

@implementation FirstLevelViewController
@synthesize controllers;

- (void)viewDidLoad {
    self.title = @"First Level";
    NSMutableArray *array = [[NSMutableArray alloc] init];
    self.controllers = array;
    
    // 더 보기 버튼
    DisclosureButtonController *disclosureButtonController =
    [[DisclosureButtonController alloc]
     initWithStyle:UITableViewStylePlain];
    disclosureButtonController.title = @"Disclosure Buttons";
    disclosureButtonController.rowImage = [UIImage
                                           imageNamed:@"disclosureButtonControllerIcon.png"];
    [array addObject:disclosureButtonController];
    [disclosureButtonController release];
    
    // 체크리스트
    CheckListController *checkListController = [[CheckListController alloc]
                                                initWithStyle:UITableViewStylePlain];
    checkListController.title = @"Check One";
    checkListController.rowImage = [UIImage imageNamed:
                                    @"checkmarkControllerIcon.png"];
    [array addObject:checkListController];
    [checkListController release];
    
    // 테이블 행 컨트롤
    RowControlsController *rowControlsController =
    [[RowControlsController alloc]
     initWithStyle:UITableViewStylePlain];
    rowControlsController.title = @"Row Controls";
    rowControlsController.rowImage = [UIImage imageNamed:
                                      @"rowControlsIcon.png"];
    [array addObject:rowControlsController];
    [rowControlsController release];

    // Move Me
    MoveMeController *moveMeController = [[MoveMeController alloc]
                                          initWithStyle:UITableViewStylePlain];
    moveMeController.title = @"Move Me";
    moveMeController.rowImage = [UIImage imageNamed:@"moveMeIcon.png"];
    [array addObject:moveMeController];
    [moveMeController release];
    
    // Delete Me
    DeleteMeController *deleteMeController = [[DeleteMeController alloc]
                                              initWithStyle:UITableViewStylePlain];
    deleteMeController.title = @"Delete Me";
    deleteMeController.rowImage = [UIImage imageNamed:@"deleteMeIcon.png"];
    [array addObject:deleteMeController];
    [deleteMeController release];
    
    // 대통령 뷰/편집
    PresidentsViewController *presidentsViewController =
    [[PresidentsViewController alloc]
     initWithStyle:UITableViewStylePlain];
    presidentsViewController.title = @"Detail Edit";
    presidentsViewController.rowImage = [UIImage imageNamed:
                                         @"detailEditIcon.png"];
    [array addObject:presidentsViewController];
    [presidentsViewController release];

    
    [array release];
    [super viewDidLoad];
}

- (void)viewDidUnload {
    self.controllers = nil;
    [super viewDidUnload];
}

- (void)dealloc {
    [controllers release];
    [super dealloc];
}

#pragma mark -
#pragma mark Table Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return [self.controllers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *FirstLevelCell= @"FirstLevelCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             FirstLevelCell];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc]
                 initWithStyle:UITableViewCellStyleDefault
                 reuseIdentifier: FirstLevelCell] autorelease];
    }
    // 셀을 설정한다.
    NSUInteger row = [indexPath row];
    SecondLevelViewController *controller =
    [controllers objectAtIndex:row];
    cell.textLabel.text = controller.title;
    cell.imageView.image = controller.rowImage;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark -
#pragma mark Table View Delegate Methods
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger row = [indexPath row];
    SecondLevelViewController *nextController = [self.controllers
                                                 objectAtIndex:row];
    [self.navigationController pushViewController:nextController
                                         animated:YES];
}

@end

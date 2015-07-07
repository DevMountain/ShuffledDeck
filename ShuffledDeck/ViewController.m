//
//  ViewController.m
//  ShuffledDeck
//
//  Created by Caleb Hicks on 7/7/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ViewController.h"
#import "CardTableViewDatasource.h"
#import "CardController.h"

@interface ViewController () <UITableViewDelegate>

@property (strong, nonatomic) IBOutlet CardTableViewDatasource *dataSource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.dataSource configureTableView:self.tableView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

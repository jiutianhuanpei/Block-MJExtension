//
//  RootViewController.m
//  BlockPassValue
//
//  Created by 沈红榜 on 15/3/19.
//  Copyright (c) 2015年 Shen Hongbang. All rights reserved.
//

#import "RootViewController.h"
#import "NetData.h"
#import <MJExtension.h>
#import "Content.h"
#import "Blocks.h"

@interface RootViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

static NSString *cellIndentifier = @"cell";

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.view.backgroundColor = [UIColor whiteColor];
     self.dataArray = [[NSMutableArray alloc] initWithCapacity:0];
     [self creatTableView];
     [self getData];
     
}

- (void)getData
{
     NetData *nnData = [[NetData alloc] init];
     [nnData getDataByUrl:@"http://po.funshion.com/v7/config/homepage?cl=aphone&ve=2.2.5.4&mac=e8bba829e1e1&uc=6"];
     [nnData sendValue:^(id data) {
          NSArray *blocks = data[@"blocks"];
          
          for (NSDictionary *dic in blocks) {
               [Blocks replacedKeyFromPropertyName];
               Blocks *blocks = [Blocks objectWithKeyValues:dic];
               [self.dataArray addObject:blocks];
          }
          
          
          [_tableView reloadData];
     }];
}

- (void)creatTableView
{
     _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height - 20) style:UITableViewStylePlain];
     _tableView.delegate = self;
     _tableView.dataSource = self;
     [self.view addSubview:_tableView];
     [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIndentifier];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
     return 30;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
     
     Blocks *block = _dataArray[section];
     return block.name;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
     return _dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
     Blocks *blocks = _dataArray[section];
     return blocks.contents.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier forIndexPath:indexPath];
     
     Blocks *blocks = _dataArray[indexPath.section];
     Content *content = blocks.contents[indexPath.row];
     cell.textLabel.text = content.name;
     
     return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

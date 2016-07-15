//
//  ViewController.m
//  slideView
//
//  Created by foscom on 16/7/15.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "ViewController.h"
#import "leftView.h"
#import "UITableView+touch.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tabv;
@property(nonatomic,strong)leftView *lview;
@property(nonatomic,assign)CGRect oldFrmae;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showLeftView)];
    
    _lview = [leftView shareMangerViewWith:self];
    _oldFrmae = _lview.frame;
    [self.navigationController.view addSubview:_lview];

    [self.view addSubview:self.tabv];


    
    
}

- (void)showLeftView
{
    [UIView animateWithDuration:0.25 animations:^{
        _lview.frame = CGRectMake(0, 0, 200, 667);
    }];
}

- (UITableView *)tabv
{
    if (_tabv == nil) {
        
        _tabv = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        
        _tabv.delegate = self;
        _tabv.dataSource = self;
        
    }
    
    return _tabv;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];

    }
    
    return cell;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_lview leftTouchMove:touches and:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_lview leftTouchEnd:touches and:event];
    
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end




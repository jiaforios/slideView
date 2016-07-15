//
//  leftView.m
//  slideView
//
//  Created by foscom on 16/7/15.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "leftView.h"
@implementation leftView

static leftView *manger = nil;

+ (id)shareMangerViewWith:(id)vc
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        
        manger = [[leftView alloc] initWithFrame:CGRectMake(-200, 0, 200, 667)];
        manger.backgroundColor = [UIColor redColor];
        
        
        [manger addObserver:manger forKeyPath:@"frame" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];

    });
    manger.aptui = vc;
    return manger;
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"frame"]) {
        //        CGRect old = [[change objectForKey:@"old"] CGRectValue];
        CGRect new = [[change objectForKey:@"new"] CGRectValue];
        
        UITableView *tabvs = [manger.aptui valueForKey:@"tabv"];
        
        if (new.origin.x!=-200) {
            
            tabvs.scrollEnabled = NO;
        }else
        {
            tabvs.scrollEnabled = YES;
            
        }
    }
}


- (void)leftTouchMove:(NSSet<UITouch *> *)touches and:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.superview];
    CGPoint prePoint = [touch previousLocationInView:self.superview];
    CGFloat offsetx = currentPoint.x - prePoint.x;
    self.frame = CGRectMake(self.frame.origin.x + offsetx, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
    
    if (self.frame.origin.x >=0) {
        self.frame = CGRectMake(0, 0, self.frame.size.width,  self.frame.size.height);
    }
    
    if (self.frame.origin.x <= -200) {
        
        self.frame = CGRectMake(-200, 0, self.frame.size.width,  self.frame.size.height);
        
    }

}

- (void)leftTouchEnd:(NSSet<UITouch *>  *)touches and:(UIEvent *)event;
{
    if (self.frame.origin.x >=0) {
        self.frame = CGRectMake(0, 0, self.frame.size.width,  self.frame.size.height);
    }
    
    if (self.frame.origin.x <= -200) {
        
        self.frame = CGRectMake(-200, 0, self.frame.size.width,  self.frame.size.height);
        
    }
    
    
    if (self.frame.origin.x > -100) {
        
        [UIView animateWithDuration:0.25 animations:^{
            
            self.frame = CGRectMake(0, 0, self.frame.size.width,  self.frame.size.height);
            
        }];
        
    }else
    {
        [UIView animateWithDuration:0.25 animations:^{
            self.frame = CGRectMake(-200, 0, self.frame.size.width,  self.frame.size.height);
            
        }];
        
    }

    
}

@end

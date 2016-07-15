//
//  leftView.h
//  slideView
//
//  Created by foscom on 16/7/15.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface leftView : UIView

+ (id)shareMangerViewWith:(id)vc;

- (void)leftTouchMove:(NSSet<UITouch *>  *)touches and:(UIEvent *)event;
- (void)leftTouchEnd:(NSSet<UITouch *>  *)touches and:(UIEvent *)event;
@property(nonatomic,strong)id aptui;

@end


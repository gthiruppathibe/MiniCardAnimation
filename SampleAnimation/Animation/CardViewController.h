//
//  CardViewController.h
//  ePrayer
//
//  Created by sri Divya on 11/02/15.
//  Copyright (c) 2015 sri Divya. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <QuartzCore/QuartzCore.h>


#import "DraggableViewBackground.h"

@interface CardViewController : UIViewController<UIPageViewControllerDataSource,DraggableViewBackgroundDelegate>

@property (weak, nonatomic) IBOutlet UIButton *showPopupBtn;
@property (weak, nonatomic) IBOutlet UIButton *passcodeBtn;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *imgBackground;

@property (strong, nonatomic) UIPageViewController *pageController; //To show prayer details


@end

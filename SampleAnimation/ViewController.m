//
//  ViewController.m
//  SampleAnimation
//
//  Created by Sandeep Sachan on 25/03/15.
//  Copyright (c) 2015 Sandeep Sachan. All rights reserved.
//

#import "ViewController.h"
#import "DraggableViewBackground.h"

@interface ViewController ()<DraggableViewBackgroundDelegate,UIGestureRecognizerDelegate>{
 DraggableViewBackground *draggableBackground;
}

@end

@implementation ViewController
@synthesize imageView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
     [self.view setMultipleTouchEnabled:YES];
    
    NSLog(@"Card Frame:%@",NSStringFromCGRect(self.view.frame));
    
    draggableBackground = [[DraggableViewBackground alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    draggableBackground.delegate=self;
    [self.view addSubview:draggableBackground];
    

//    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handledoubleTapFrom:)];
//    [doubleTap setNumberOfTapsRequired:2];
//    doubleTap.numberOfTouchesRequired = 2;
//    [self.view addGestureRecognizer:doubleTap];
//    
//    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapSelected:)];
//    [singleTap setNumberOfTapsRequired:1];
//    singleTap.numberOfTouchesRequired = 1;
//    [singleTap requireGestureRecognizerToFail:doubleTap];
//    [self.view addGestureRecognizer:singleTap];
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
//    UIView *myView = imageView;
//    CALayer *layer = myView.layer;
//    CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
//    rotationAndPerspectiveTransform.m34 = 1.0 / -1000;
//    rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, M_PI / 0.3, 0.0f, 1.0f, 0.0f);
//    layer.transform = rotationAndPerspectiveTransform;
//    [UIView animateWithDuration:1.0 animations:^{
//        layer.transform = CATransform3DIdentity;
//    }];
    
 
    
  
}

- (void) handledoubleTapFrom: (UITapGestureRecognizer *)recognizer
{
    //Code to handle the gesture
    
    
}

- (void) singleTapSelected: (UITapGestureRecognizer *)recognizer
{
    //Code to handle the gesture
        UIView *myView = draggableBackground;
        CALayer *layer = myView.layer;
        CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
        rotationAndPerspectiveTransform.m34 = 1.0 / -1000;
        rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, M_PI / 0.3, 0.0f, 1.0f, 0.0f);
        layer.transform = rotationAndPerspectiveTransform;
        [UIView animateWithDuration:1.0 animations:^{
            layer.transform = CATransform3DIdentity;
        }];
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *aTouch in touches) {
        if (aTouch.tapCount >= 2) {
            // The view responds to the tap
           
        }
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
}


@end

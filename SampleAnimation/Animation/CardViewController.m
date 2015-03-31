







//
//  CardViewController.m
//  ePrayer
//
//  Created by sri Divya on 11/02/15.
//  Copyright (c) 2015 sri Divya. All rights reserved.
//

#import "CardViewController.h"
#import "ViewController.h"



//const int pageSize=5;

@interface CardViewController ()
{
    DraggableViewBackground *draggableBackground;
    int indexToGetPrayer;
    int pageSize;
}

@property (nonatomic, strong) ViewController *submenuViewController;
@property (nonatomic, strong)UITapGestureRecognizer *singleTap;
@end

@implementation CardViewController
@synthesize showPopupBtn;

#pragma mark - Constructor
- (id)init
{
    self = [super initWithNibName:@"CardViewController" bundle:nil];
    if (self)
    {
        // Custom initialization
        self.tabBarItem.title = @"Prayers";

    }
    return self;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // self.title = @"My Title";
    }
    
    self.title = @"Prayers";
    return self;
}
#pragma mark - View WILL APPEAR
-(void)viewWillAppear:(BOOL)animated
{

    self.hidesBottomBarWhenPushed = NO;
    
//    _singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    
//    if([EPSessionEngine sharedEngine].ID == nil && !([[NSUserDefaults standardUserDefaults]boolForKey:@"LoggedIn"]))
//    {
//    [self.view addGestureRecognizer:_singleTap];
//    }

}
-(void)configureNavigationBarBackButton:(NSString*)hexCode
{
    [UIView animateWithDuration:.25 animations:^{
 
         } completion:^(BOOL finished) {
       
          
             
             
             
//             [self.view bringSubviewToFront:self.navigationController.navigationBar];
         }];
}
#pragma mark - VIEW DID LOAD
- (void)viewDidLoad {
    
    [super viewDidLoad];

    [self.tableView setAlpha:0.0];
    
    NSLog(@"Card Frame:%@",NSStringFromCGRect(self.view.frame));
    
    __block CardViewController *crd=self;
    
    //[NSString stringWithFormat:@"getPublicPrayerRequests/%d/%d/",0,5]
    //@"getPrayerRequest"
    
    
//        pageSize=MIN(5, (int)[apDelegate.arrCardInfo count]);
    
            [self showDetailView];
    
            draggableBackground = [[DraggableViewBackground alloc]initWithFrame:self.view.frame];
            draggableBackground.delegate=self;
            [crd.view addSubview:draggableBackground];
    
    

    [self setRoundedBorder:5 borderWidth:1 color:[UIColor whiteColor] forButton:showPopupBtn];
    // Do any additional setup after loading the view from its nib.
}

-(void)getPublicPrayerRequest :(int)pageIndex :(int)pageSizeInt
{
    

    
}
-(void)handleSingleTap:(UITapGestureRecognizer *)sender{
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Login" bundle:nil];

  //  [self hideTabBar];
     [self.view removeGestureRecognizer:_singleTap];
 
    
}
#pragma mark -
#pragma mark - UIBarButtonItems

- (UIBarButtonItem *)leftMenuBarButtonItem {
    return [[UIBarButtonItem alloc]
            initWithImage:[UIImage imageNamed:@"MenuIcon_Normal"] style:UIBarButtonItemStyleBordered
            target:self
            action:@selector(leftSideMenuButtonPressed:)];
}
- (UIBarButtonItem *)backBarButtonItem {
    
    return [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Icon_Backarrow_22x22.png"]
                                            style:UIBarButtonItemStylePlain
                                           target:self
                                           action:@selector(backButtonPressed:)];
    
    
}
#pragma mark -
#pragma mark - UIBarButtonItem Callbacks

- (void)backButtonPressed:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addNewPrayerButtonPressed:(id)sender {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    EPNewPrayerRequestViewController * newPrayerRequest = [sb instantiateViewControllerWithIdentifier:@"EPNewPrayerRequestViewControllerID"];
//     self.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:newPrayerRequest animated:YES];
   
}
#pragma mark - SHOW SIGNIN POPUP

- (IBAction)showPopUp:(id)sender {
    
    
    
}


#pragma mark - PASSCODE Button Action 

- (IBAction)showPasscodeController:(id)sender
{
//    EPPassCodeViewController *passcodeController = [[EPPassCodeViewController alloc] init];
//    passcodeController.delegate = self;
//    UINavigationController *passcodeNavigationController = [[UINavigationController alloc] initWithRootViewController:passcodeController];
//    [self.navigationController presentViewController:passcodeNavigationController animated:YES completion:nil];
    
}


-(void)hideTabBar
{   UITabBarController * tabbarcontroller= self.tabBarController;
    if (tabbarcontroller.tabBar.isHidden)
    {
        return;
    }
    tabbarcontroller.tabBar.hidden=YES;

     self.navigationController.navigationBar.userInteractionEnabled = NO;
}
-(void)showTabBar
{    UITabBarController * tabbarcontroller=self.tabBarController;
    if (!tabbarcontroller.tabBar.isHidden)
    {
        return;
    }
   [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
//    self.navigationController.navigationBar.backgroundColor = [UIColor lightGrayColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]}];
    self.navigationController.navigationBar.userInteractionEnabled = YES;
    tabbarcontroller.tabBar.hidden=NO;
//    if([EPSessionEngine sharedEngine].ID == nil && !([[NSUserDefaults standardUserDefaults]boolForKey:@"LoggedIn"]))
//    {
//    [self.view addGestureRecognizer:_singleTap];
//    }
}

- (void)setRoundedBorder:(float)radius borderWidth:(float)borderWidth color:(UIColor*)color forButton:(UIButton *)button
{
    CALayer * l = [button layer];
    [l setMasksToBounds:YES];
    [l setCornerRadius:radius];
    // You can even add a border
    [l setBorderWidth:borderWidth];
    [l setBorderColor:[color CGColor]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//-(void)dismissSignUpController:(SignUpViewController *)controller
//{
//    [controller dismissViewControllerAnimated:YES completion:nil];
//    [self.signInViewController dismissViewControllerAnimated:YES completion:nil];
////    [self.navigationController popToRootViewControllerAnimated:YES];
//}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

-(void) SignIn:(UIView*)childView{
    
 [childView removeFromSuperview];
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
  //  UINavigationController *navControl = [[UINavigationController alloc]initWithRootViewController:signInThroughEmail];
//    [navControl pushViewController:navControl animated:YES ];
      self.hidesBottomBarWhenPushed = YES;
  
     self.hidesBottomBarWhenPushed = NO;
}

-(void) SignInThroughFacebook:(UIView*)childView
{
    [childView removeFromSuperview];
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

    //    UINavigationController *navControl = [[UINavigationController alloc]initWithRootViewController:hvc];
    //    [navControl pushViewController:hvc animated:YES ];
    self.hidesBottomBarWhenPushed = YES;
  
    self.hidesBottomBarWhenPushed = NO;
    
}
-(void)comingFromFacebookAuth:(UIView*)childView
{
    [childView removeFromSuperview];

}

#pragma mark - TableView
-(void)draggableTableCall
{
    [self.view bringSubviewToFront:self.tableView];
    [UIView animateWithDuration:1.0 animations:^{
        [self.tableView setAlpha:1.0];
    } completion:^(BOOL finished) {
        
    }];
}

-(void)pushPrayerDetailVC
{
           
 
}

#pragma mark - Page datasource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
//    NSUInteger index = [(CardDetailViewController *)viewController index];
//    
//    if (index == 0) {
//        return nil;
//    }
//    
//    // Decrease the index by 1 to return
//    index--;
//    
//    return [self viewControllerAtIndex:index];
//
    return nil;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
//    NSUInteger index = [(CardDetailViewController *)viewController index];
//    
//    index++;
// 
//    }
    
    return nil;
    
}

-(void)acceptPrayerRequest:(NSDictionary*)prayerData {
    
   
  
}



@end

//
//  SecureVC.m
//  Task7
//
//  Created by Alexey on 7/3/21.
//  Copyright © 2021 PathFinder. All rights reserved.
//

#import "SecureVC.h"

@interface SecureVC ()
@end


@implementation SecureVC
@synthesize result;

// MARK: - Draw and color frame border if code is wrong
- (void)drawFrameBorder{
    CALayer *topBorder = [CALayer layer];
    topBorder.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height);
    topBorder.borderWidth = 2;
    topBorder.cornerRadius = 10;
    topBorder.borderColor = [[UIColor colorNamed: @"venetianRed"] CGColor];
    [self.view.layer addSublayer:topBorder];
}

// MARK: - First button action
- (IBAction)buttonTap1:(UIButton * )sender {
    if (result.text.length == 1 || result.text.length == 6) {
        result.text = @"";
    }
    NSString *one = @"1";
    result.text = [NSString stringWithFormat:@"%@ %@", result.text, one];
    if (result.text.length == 6){
        [self drawFrameBorder];
    }
}

// MARK: - Second button action
- (IBAction)buttonTap2:(UIButton * )sender {
    if (result.text.length == 1  || result.text.length == 6){
        result.text = @"";
    }
    NSString *two = @"2";
    result.text = [NSString stringWithFormat:@"%@ %@", result.text, two];
    if (self.result.text.length == 6){
        CALayer *topBorder = [CALayer layer];
        topBorder.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height);
        topBorder.borderWidth = 2;
        topBorder.cornerRadius = 10;
      
        if([self.result.text isEqualToString: @" 1 3 2"]){
            topBorder.borderColor = [[UIColor colorNamed: @"turquoiseGreen"] CGColor];
            [self showAlertController];
        }
    
        else{
            topBorder.borderColor = [[UIColor colorNamed: @"venetianRed"] CGColor];
        }
        [self.view.layer addSublayer:topBorder];
    }
}

// MARK: - Third button tapped
- (IBAction)buttonTap3:(UIButton * )sender {
    if (self.result.text.length == 1  || result.text.length == 6) {
        self.result.text = @"";
    }
    NSString *three = @"3";
    self.result.text = [NSString stringWithFormat:@"%@ %@", result.text, three];
    if (result.text.length == 6){
        [self drawFrameBorder];
    }
}

-(void) setupView {
    self.view.frame = CGRectMake(0, 44, 320, 416);
    self.view.layer.cornerRadius = 10;
    self.view.layer.borderColor = [[UIColor colorNamed: @"littleBoyBlue"] CGColor];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    
    // MARK: - First button implementation
    
    UIButton *firstRoundButton = [[UIButton alloc] initWithFrame:(CGRect)CGRectMake(23, 44, 50, 50)];
    
    [firstRoundButton setTitle: @"1" forState:UIControlStateNormal];
    [firstRoundButton setTitleColor:[UIColor colorNamed: @"littleBoyBlue"] forState:UIControlStateNormal];
    [firstRoundButton.titleLabel setFont:[UIFont boldSystemFontOfSize:24]];
    [firstRoundButton addTarget:self action:@selector(buttonTap1:) forControlEvents:UIControlEventTouchUpInside];
    firstRoundButton.clipsToBounds = YES;
    firstRoundButton.layer.cornerRadius = 25;
    firstRoundButton.layer.borderColor=[[UIColor colorNamed: @"littleBoyBlue"] CGColor];;
    firstRoundButton.layer.borderWidth = 2.0;
    
    [self.view addSubview:firstRoundButton];
    
    // MARK: - Second button implementation
    
    UIButton *secondRoundButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [secondRoundButton setTitle: @"2" forState:UIControlStateNormal];
    [secondRoundButton setTitleColor:[UIColor colorNamed: @"littleBoyBlue"] forState:UIControlStateNormal];
    [secondRoundButton.titleLabel setFont:[UIFont boldSystemFontOfSize:24]];
    [secondRoundButton addTarget:self action:@selector(buttonTap2:) forControlEvents:UIControlEventTouchUpInside];
    secondRoundButton.frame = CGRectMake(92,44, 50, 50);
    secondRoundButton.clipsToBounds = YES;
    secondRoundButton.layer.cornerRadius = 25;
    secondRoundButton.layer.borderColor= [[UIColor colorNamed: @"littleBoyBlue"] CGColor];;
    secondRoundButton.layer.borderWidth = 2.0;
    
    [self.view addSubview:secondRoundButton];
    
    // MARK: - Third button implementation
    
    UIButton *thirdRoundButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [thirdRoundButton setTitle: @"3" forState:UIControlStateNormal];
    [thirdRoundButton setTitleColor:[UIColor colorNamed: @"littleBoyBlue"] forState:UIControlStateNormal];
    [thirdRoundButton.titleLabel setFont:[UIFont boldSystemFontOfSize:24]];
    [thirdRoundButton addTarget:self action:@selector(buttonTap3:) forControlEvents:UIControlEventTouchUpInside];
    thirdRoundButton.frame = CGRectMake(161, 44, 50, 50);
    thirdRoundButton.clipsToBounds = YES;
    thirdRoundButton.layer.cornerRadius = 25;
    thirdRoundButton.layer.borderColor=[[UIColor colorNamed: @"littleBoyBlue"] CGColor];;
    thirdRoundButton.layer.borderWidth = 2.0;
    
    [self.view addSubview:thirdRoundButton];
    
    // MARK: - Entered code
    result = [[UILabel alloc] initWithFrame:CGRectMake(92, 11, 50, 22)];
    [result setText: @"-"];
    result.textAlignment = NSTextAlignmentCenter;
    result.font = [UIFont boldSystemFontOfSize:18];
    [self.view addSubview: result];
}


- (void) showAlertController{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Welcome"
                                                  message:@"You are successfully authorized!"
                                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Refresh" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end

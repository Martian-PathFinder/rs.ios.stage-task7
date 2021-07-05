//
//  LoginVC.m
//  Task7
//
//  Created by Alexey on 7/2/21.
//  Copyright © 2021 PathFinder. All rights reserved.
//
#import "LoginVC.h"
#import "SecureVC.h"

@interface LoginVC ()
@property (nonatomic) UILabel *logoLabel;
@property (nonatomic) UITextField *usernameTextField;
@property (nonatomic) UITextField *passwordTextField;
@property (nonatomic) UIButton *authorizeButton;
@property (nonatomic) SecureVC *secureVC;
@property (assign, nonatomic) BOOL isChildViewControllerAdded;

@property (weak, nonatomic) NSLayoutConstraint *topContraint;
@property (weak, nonatomic) NSLayoutConstraint *bottomContraint;
@end

// MARK: - Keyboard category
@interface LoginVC (KeyboardHandling)
- (void)subscribeOnKeyboardEvents;
- (void)updateTopContraintWith:(CGFloat) constant andBottom:(CGFloat) bottomConstant;
- (void)hideWhenTappedAround;
@end

@implementation LoginVC

// MARK: - Authorize button action
- (void)authorizeButtonTapped:(UIButton * )sender {
    
    NSString *username = self.usernameTextField.text;
    NSString *password = self.passwordTextField.text;
    
    BOOL loginCorrect = [username isEqualToString: @"username"];
    BOOL passwordCorrect = [password isEqualToString:@"password"];
    
    if(loginCorrect && passwordCorrect){
        
        self.usernameTextField.layer.borderColor = [[UIColor colorNamed: @"turquoiseGreen"] CGColor];
        self.passwordTextField.layer.borderColor = [[UIColor colorNamed: @"turquoiseGreen"] CGColor];
        
        self.usernameTextField.enabled = NO;
        self.passwordTextField.enabled = NO;
        self.authorizeButton.enabled = NO;
        self.usernameTextField.layer.borderColor = [[UIColor colorNamed: @"turquoiseInactive"] CGColor];
        self.passwordTextField.layer.borderColor = [[UIColor colorNamed: @"turquoiseInactive"] CGColor];
        self.authorizeButton.layer.borderColor = [[UIColor colorNamed: @"littleBoyBlueInactive"] CGColor];
        self.usernameTextField.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        self.passwordTextField.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        
        self.isChildViewControllerAdded = YES;
        self.secureVC = [[SecureVC alloc] init];
        [self addChildViewController:self.secureVC];
        self.secureVC.view.frame = CGRectMake(72.0, 506.0, 234.0, 109.0);
        [self.view addSubview:self.secureVC.view];
        [self.secureVC didMoveToParentViewController:self];
    }
    else{
        if (!loginCorrect) {
            self.usernameTextField.layer.borderColor = [UIColor colorNamed: @"venetianRed"].CGColor;
        }
        if (!passwordCorrect) {
            self.passwordTextField.layer.borderColor = [UIColor colorNamed: @"venetianRed"].CGColor;
        }
        
    }
}


- (void)loadView
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    view.backgroundColor = [UIColor whiteColor];
    self.view = view;
    self.isChildViewControllerAdded = NO;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // MARK: - Add "RSSchool" label
    UILabel *myLabel = [[UILabel alloc]initWithFrame:CGRectMake(110, 108, 199, 50)];
    [myLabel setFont:[UIFont boldSystemFontOfSize:36]];
    [myLabel setText:@"RSSchool"];
    [[self view] addSubview:myLabel];
  
    // MARK: - implement username textField
    self.usernameTextField = [[UITextField alloc] initWithFrame:CGRectMake(36, 200, [UIScreen mainScreen].bounds.size.width - 72, 42)];
    self.usernameTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.usernameTextField.layer.cornerRadius = 5;
    self.usernameTextField.layer.borderWidth = 1.5;
    self.usernameTextField.layer.borderColor= [[UIColor colorNamed: @"blackCoral"] CGColor];
    self.usernameTextField.font = [UIFont systemFontOfSize:20];
    self.usernameTextField.placeholder = @"Login";
    self.usernameTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.usernameTextField.keyboardType = UIKeyboardTypeDefault;
    self.usernameTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.usernameTextField.returnKeyType = UIReturnKeyDone;
    self.usernameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.usernameTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self.view addSubview: self.usernameTextField];
    
    
    // MARK: - implement password textField
    self.passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(36, 270, [UIScreen mainScreen].bounds.size.width - 72, 42)];
    self.passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.passwordTextField.layer.cornerRadius = 5;
    self.passwordTextField.layer.borderWidth = 1.5;
    self.passwordTextField.layer.borderColor= [[UIColor colorNamed: @"blackCoral"] CGColor];
    self.passwordTextField.font = [UIFont systemFontOfSize:20];
    self.passwordTextField.placeholder = @"Password";
    self.passwordTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.passwordTextField.keyboardType = UIKeyboardTypeDefault;
    self.usernameTextField.autocapitalizationType = UITextAutocorrectionTypeNo;
    self.passwordTextField.secureTextEntry = true;
    self.passwordTextField.returnKeyType = UIReturnKeyDone;
    self.passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.passwordTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self.view addSubview: self.passwordTextField];
    
    // MARK: - implement authorize button
    self.authorizeButton = [[UIButton alloc] initWithFrame:CGRectMake(110.0, 370.0, [UIScreen mainScreen].bounds.size.width - 220, 42.0)];
    [self.authorizeButton setTitleColor:[UIColor colorNamed: @"littleBoyBlue"] forState:UIControlStateNormal];
    [self.authorizeButton setTitle:@"Authorize" forState:UIControlStateNormal];
    [self.authorizeButton.titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
    self.authorizeButton.layer.cornerRadius = 10;
    self.authorizeButton.layer.borderWidth = 2;

    UIImage *btnImage = [UIImage imageNamed:@"person2x"];
    UIImage *btnImageHighlighted = [UIImage imageNamed:@"person-fill2x"];
    
    [self.authorizeButton setTitleColor:[UIColor colorNamed: @"littleBoyBlue"] forState:UIControlStateNormal];
    [self.authorizeButton setImage:btnImage forState:UIControlStateNormal];
    
    [self.authorizeButton setTitleColor:[UIColor colorNamed: @"littleBoyBlue04"] forState:UIControlStateHighlighted];
    [self.authorizeButton setImage:btnImageHighlighted forState:UIControlStateHighlighted];
    self.authorizeButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
    self.authorizeButton.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    self.authorizeButton.layer.borderColor= [[UIColor colorNamed: @"littleBoyBlue"] CGColor];
    [self.authorizeButton addTarget:self action:@selector(authorizeButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: self.authorizeButton];
    
    // MARK: - Keyboard management
    [self subscribeOnKeyboardEvents];
    [self hideWhenTappedAround];
}


// MARK: - Delegates

// TextField
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return [self.passwordTextField becomeFirstResponder];
}

@end


// MARK: - Keyboard category
@implementation LoginVC (KeyboardHandling)

- (void)subscribeOnKeyboardEvents {
    [NSNotificationCenter.defaultCenter addObserver:self
                                           selector:@selector(keybaordWillShow:)
                                               name:UIKeyboardWillShowNotification
                                             object:nil];
    [NSNotificationCenter.defaultCenter addObserver:self
                                           selector:@selector(keybaordWillHide:)
                                               name:UIKeyboardWillHideNotification
                                             object:nil];
}

// MARK: - Hide keyboard when tapped outside
- (void)hideWhenTappedAround {
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                              action:@selector(hide)];
    [self.view addGestureRecognizer:gesture];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self hide];
    return YES;
}

- (void)hide {
    [self.view endEditing:true];
}

- (void)keybaordWillShow:(NSNotification *)notification {
    CGRect rect = [(NSValue *)notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    [self updateTopContraintWith:15.0 andBottom:rect.size.height - self.view.safeAreaInsets.bottom + 15.0];
}

- (void)keybaordWillHide:(NSNotification *)notification {
    [self updateTopContraintWith:200.0 andBottom:0.0];
}

- (void)updateTopContraintWith:(CGFloat) constant andBottom:(CGFloat) bottomConstant {
    self.topContraint.constant = constant;
    self.bottomContraint.constant = bottomConstant;
    [UIView animateWithDuration:0.2 animations:^{
        [self.view layoutIfNeeded];
    }];
}

@end

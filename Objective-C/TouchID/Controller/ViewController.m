//
//  ViewController.m
//  TouchID
//
//  Created by John Lima on 20/04/17.
//  Copyright © 2017 John Lima. All rights reserved.
//

#import "ViewController.h"
#import "Global.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - View LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.textField resignFirstResponder];
}

#pragma mark - Actions
-(IBAction)startTouchId:(UIButton *)sender {
    [self useTouchId];
}

-(void)useTouchId {

    LAContext *context = [[LAContext alloc] init];
    NSError *error = nil;
    
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:MESSAGE_PUT_FINGER_ON_SENSOR reply:^(BOOL success, NSError * _Nullable error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (success) {
                    self.textField.text = MESSAGE_SECRET_MESSAGE;
                }else {
                    NSLog(@"Error: %@ - %@", MESSAGE_WRONG_FINGER, error.localizedDescription);
                }
            });
        }];
    }else {
        NSLog(@"%@", MESSAGE_UNSUPPORTED_DEVICE);
    }
}

@end

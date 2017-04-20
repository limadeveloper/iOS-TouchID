//
//  ViewController.h
//  TouchID
//
//  Created by John Lima on 20/04/17.
//  Copyright © 2017 John Lima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <LocalAuthentication/LocalAuthentication.h>

@interface ViewController : UIViewController

#pragma mark - Properties
@property (weak, nonatomic) IBOutlet UITextField *textField;

#pragma mark - Actions
-(IBAction)startTouchId:(UIButton *)sender;

@end


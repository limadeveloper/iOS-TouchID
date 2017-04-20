//
//  Global.h
//  TouchID
//
//  Created by John Lima on 20/04/17.
//  Copyright © 2017 John Lima. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MESSAGE_UNSUPPORTED_DEVICE @"No Biometric Sensor Has Been Detected. This device does not support Touch Id."
#define MESSAGE_PUT_FINGER_ON_SENSOR @"Put you finger on biometric sensor"
#define MESSAGE_WRONG_FINGER @"Something wrong"
#define MESSAGE_SECRET_MESSAGE @"This a secret message"

@interface Global : NSObject

@end

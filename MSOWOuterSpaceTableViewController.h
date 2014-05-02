//
//  MSOWOuterSpaceTableViewController.h
//  Out of This World
//
//  Created by Mat Sletten on 4/25/14.
//  Copyright (c) 2014 Mat Sletten. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSOWAddObjectViewController.h"

@interface MSOWOuterSpaceTableViewController : UITableViewController <MSOWAddObjectViewControllerDelegate>

@property (strong, nonatomic) NSMutableArray *planets;
@property (strong, nonatomic) NSMutableArray *addSpaceObject;

//NSUserDefaults can hold objects that are or are entirely comprised of property lists which include NSData, NSString, NSNumber, NSDate, NSArray, or NSDictionary or properties such as BOOLs, Floats, doubles, integers, URLs
@end

//
//  MSOWPlanetDataViewController.h
//  Out of This World
//
//  Created by Mat Sletten on 4/29/14.
//  Copyright (c) 2014 Mat Sletten. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSOWSpaceObject.h"

@interface MSOWPlanetDataViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *planetDataTableView;
@property (strong, nonatomic) MSOWSpaceObject *planetObject;

@end

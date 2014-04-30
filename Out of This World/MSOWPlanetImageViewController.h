//
//  MSOWPlanetImageViewController.h
//  Out of This World
//
//  Created by Mat Sletten on 4/28/14.
//  Copyright (c) 2014 Mat Sletten. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSOWSpaceObject.h"

@interface MSOWPlanetImageViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *planetScrollView;
@property (strong, nonatomic) UIImageView *planetImageView;
@property (strong, nonatomic) MSOWSpaceObject *currentPlanetObject;

@end

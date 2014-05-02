//
//  MSOWAddObjectViewController.m
//  Out of This World
//
//  Created by Mat Sletten on 4/30/14.
//  Copyright (c) 2014 Mat Sletten. All rights reserved.
//

#import "MSOWAddObjectViewController.h"

@interface MSOWAddObjectViewController ()

@end

@implementation MSOWAddObjectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIImage *orionImage = [UIImage imageNamed:@"Orion.jpg"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:orionImage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addButtonPressed:(UIButton *)sender
{
    MSOWSpaceObject *newSpaceObject = [self returnNewSpaceObject];
    [self.addObjectDelegate addObject:newSpaceObject];
}

- (IBAction)cancelButtonPressed:(UIButton *)sender
{
    [self.addObjectDelegate didCancel];
}

- (MSOWSpaceObject *)returnNewSpaceObject
{
    MSOWSpaceObject *addedSpaceObject = [[MSOWSpaceObject alloc] init];
    addedSpaceObject.planetName = self.addNameText.text;
    addedSpaceObject.planetNickname = self.addNicknameText.text;
    addedSpaceObject.planetDiameter = [self.addDiameterText.text floatValue];
    addedSpaceObject.planetTemperature = [self.addTemperatureText.text floatValue];
    addedSpaceObject.planetMoons = [self.addMoonsText.text intValue];
    addedSpaceObject.planetFact = self.addFactText.text;
    addedSpaceObject.planetImage = [UIImage imageNamed:@"EinsteinRing.jpg"];
    
    return addedSpaceObject;
}
@end

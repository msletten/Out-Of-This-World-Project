//
//  MSOWPlanetDataViewController.m
//  Out of This World
//
//  Created by Mat Sletten on 4/29/14.
//  Copyright (c) 2014 Mat Sletten. All rights reserved.
//

#import "MSOWPlanetDataViewController.h"

@interface MSOWPlanetDataViewController ()

@end

@implementation MSOWPlanetDataViewController

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
    self.view.backgroundColor = [UIColor blackColor];
    self.planetDataTableView.backgroundColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  MSOWPlanetImageViewController.m
//  Out of This World
//
//  Created by Mat Sletten on 4/28/14.
//  Copyright (c) 2014 Mat Sletten. All rights reserved.
//

#import "MSOWPlanetImageViewController.h"

@interface MSOWPlanetImageViewController ()

@end

@implementation MSOWPlanetImageViewController

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
    self.planetImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Jupiter.jpg"]];
    self.planetScrollView.contentSize = self.planetImageView.frame.size;
    [self.planetScrollView addSubview:self.planetImageView];
    self.planetScrollView.maximumZoomScale = 4;
    self.planetScrollView.minimumZoomScale= 1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

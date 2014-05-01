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
	// Do any additional setup after loading the view. Use self to reference object declared in .h file and access property of that object
    //To set up a scrollView, use the object or class with the Scroll View Delegate protocol to set a specific view for scrolling
    self.planetImageView = [[UIImageView alloc] initWithImage:self.currentPlanetObject.planetImage];
    self.planetScrollView.contentSize = self.planetImageView.frame.size;
    [self.planetScrollView addSubview:self.planetImageView];
   // To configure scroll view zoom, use property delegate of UIScrollView to set equal to self (declared above) with max and min float values
    self.planetScrollView.delegate = self;
    self.planetScrollView.minimumZoomScale = 0.5;
    self.planetScrollView.maximumZoomScale = 2.0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Set the View for Scrolling with the method below
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.planetImageView;
}
@end

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
//below is how to use a TableView on a ViewController to set up a dynamic table list (dictionary) about an NSArray Object.
#pragma mark - UITableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PlanetCell";
    UITableViewCell *planetCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    switch (indexPath.row)
    {
        case 0:
            planetCell.textLabel.text = @"Nickname:";
            planetCell.detailTextLabel.text = self.planetObject.planetNickname;
            break;
        case 1:
            planetCell.textLabel.text = @"Diameter (km):";
            planetCell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.planetObject.planetDiameter];
            break;
        case 2:
            planetCell.textLabel.text = @"Gravity:";
            planetCell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.planetObject.planetGravitationalForce];
            break;
        case 3:
            planetCell.textLabel.text = @"Year Length (days):";
            planetCell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.planetObject.planetYearLength];
            break;
        case 4:
            planetCell.textLabel.text = @"Day Length (hr):";
            planetCell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.planetObject.planetDayLength];
            break;
        case 5:
            planetCell.textLabel.text = @"Temperature (C):";
            planetCell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.planetObject.planetTemperature];
            break;
        case 6:
            planetCell.textLabel.text = @"Moon(s):";
            planetCell.detailTextLabel.text = [NSString stringWithFormat:@"%i", self.planetObject.planetMoons];
            break;
        case 7:
            planetCell.textLabel.text = @"Fact:";
            planetCell.detailTextLabel.text = self.planetObject.planetFact;
            break;
        default:
            break;
    }
    
    return planetCell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

@end

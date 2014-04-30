//
//  MSOWOuterSpaceTableViewController.m
//  Out of This World
//
//  Created by Mat Sletten on 4/25/14.
//  Copyright (c) 2014 Mat Sletten. All rights reserved.
//

#import "MSOWOuterSpaceTableViewController.h"
#import "AstronomicalData.h"
#import "MSOWSpaceObject.h"
#import "MSOWPlanetImageViewController.h"

@interface MSOWOuterSpaceTableViewController ()

@end

@implementation MSOWOuterSpaceTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
//    self.planets = [[NSMutableArray alloc] init]; used to add objects to the array one at a time
//  To set up and array of static NSString Objects
    
//    NSString *planet1 = @"Mercury";
//    NSString *planet2 = @"Venus";
//    NSString *planet3 = @"Earth";
//    NSString *planet4 = @"Mars";
//    NSString *planet5 = @"Jupiter";
//    NSString *planet6 = @"Saturn";
//    NSString *planet7 = @"Uranus";
//    NSString *planet8 = @"Neptune";
//    
//    self.planets = [[NSMutableArray alloc] initWithObjects:planet1, planet2, planet3, planet4, planet5, planet6, planet7, planet8, nil];
    
    //to add objects one at a time to an array instead of initializing with objects as shown above.
//    [self.planets addObject:planet1];
//    [self.planets addObject:planet2];
//    [self.planets addObject:planet3];
//    [self.planets addObject:planet4];
//    [self.planets addObject:planet5];
//    [self.planets addObject:planet6];
//    [self.planets addObject:planet7];
//    [self.planets addObject:planet8];
    
    self.planets = [[NSMutableArray alloc] init];
    
    for (NSMutableDictionary *planetDictionaries in [AstronomicalData allKnownPlanets])
    {
        NSString *planetImageName = [NSString stringWithFormat:@"%@.jpg", planetDictionaries[PLANET_NAME]];
        MSOWSpaceObject *currentPlanet = [[MSOWSpaceObject alloc] initWithPlanetData:planetDictionaries andImage:[UIImage imageNamed:planetImageName]];
        [self.planets addObject:currentPlanet];
    }
    
    //Set Mutable Dictionary below
//    NSMutableDictionary *myDictionary = [[NSMutableDictionary alloc] init];
//    NSString *firstColor = @"red";
//    [myDictionary setObject:firstColor forKey:@"Fire Truck Color"];
//    [myDictionary setObject:@"blue" forKey:@"Ocean Color"];
//    [myDictionary setObject:@"yellow" forKey:@"Star Color"];
//    NSLog(@"%@", myDictionary);
//    
//    NSString *blueString = [myDictionary objectForKey:@"Ocean Color"];
//    NSLog(@"%@", blueString);
    
    
    NSNumber *myNumber = [NSNumber numberWithInt:5];
    NSLog(@"%@", myNumber);
    NSNumber    *myFloat = [NSNumber numberWithFloat:4.31];
    NSLog(@"%@", myFloat);
    
}
//Segue data passing below. isKindOfClass is a BOOL call on sender(id), which is a TableViewCell in this case. destinationViewController is a property of segue, and can be called with BOOL isKindOfClass also. tableView is a property of a TableViewController, accessible with self. IBOutlets and UI elements are not available to the segue method until they are passed to a view controller. 
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:[UITableViewCell class]])
    {
        if ([segue.destinationViewController isKindOfClass:[MSOWPlanetImageViewController class]])
        {
            MSOWPlanetImageViewController *nextViewController = segue.destinationViewController;
            NSIndexPath *planetCells = [self.tableView indexPathForCell:sender];
            //Use the longfor to index into a specific table cell as shown below;
            //MSOWSpaceObject *selectedPlanet = [self.planets objectAtIndex:planetCells.row];
            //or alternativelly by using a literal
            MSOWSpaceObject *selectedPlanet = self.planets[planetCells.row];
            nextViewController.currentPlanetObject = selectedPlanet;
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
//    if (section == 0)
//    {
//        return 3;
//    }
//    else
//    {
//    return 2;
//    }
    return [self.planets count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...one at a time first and then for multiple sections
    //cell.textLabel.text = @"whoa my first table view";
    //for multiple sections
//    cell.textLabel.text = [self.planets objectAtIndex:indexPath.row];
//    
//    if (indexPath.section == 0)
//    {
//        cell.backgroundColor = [UIColor greenColor];
//    }
//    else
//    {
//        cell.backgroundColor = [UIColor yellowColor];
//    }
//    return cell;
    
    MSOWSpaceObject *planet = [self.planets objectAtIndex:indexPath.row];
    cell.textLabel.text = planet.planetName;
    cell.detailTextLabel.text = planet.planetNickname;
    cell.imageView.image = planet.planetImage;
    
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end

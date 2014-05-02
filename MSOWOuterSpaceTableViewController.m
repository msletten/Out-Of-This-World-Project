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
#import "MSOWPlanetDataViewController.h"

@interface MSOWOuterSpaceTableViewController ()

@end

@implementation MSOWOuterSpaceTableViewController
#define ADDED_SPACED_OBJECTS_KEY @"Added Space Objects Array"

#pragma mark - Lazy Instantiation of Properites
-(NSMutableArray *) planets
{
    if (!_planets)
    {
        _planets = [[NSMutableArray alloc] init];
    }
    return _planets;
}

-(NSMutableArray *) addSpaceObject
{
    if (!_addSpaceObject)
    {
        _addSpaceObject = [[NSMutableArray alloc] init];
    }
    return _addSpaceObject;
}

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
    //Commented out this instantiated planets array because we replaced it with lazy instantiation above.
    //self.planets = [[NSMutableArray alloc] init];
    
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

    
}
#pragma mark -Prepapre for Segue Method
//Segue data passing below. isKindOfClass is a BOOL call on sender(id), which is a TableViewCell in this case. destinationViewController is a property of segue, and can be called with BOOL isKindOfClass also. tableView is a property of a TableViewController, accessible with self. IBOutlets and UI elements are not available to the segue method until they are passed to a view controller. 
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:[UITableViewCell class]])
    {
        if ([segue.destinationViewController isKindOfClass:[MSOWPlanetImageViewController class]])
        {
            MSOWPlanetImageViewController *nextViewController = segue.destinationViewController;
            NSIndexPath *planetCells = [self.tableView indexPathForCell:sender];
            //Use the longform to index into a specific table cell as shown below;
            //MSOWSpaceObject *selectedPlanet = [self.planets objectAtIndex:planetCells.row];
            //or alternativelly by using a literal. Use the if, else if argument to determine which planet scrollView shows up, the existing planet from the array or the planet that was added.
            MSOWSpaceObject *selectedPlanet;
            if (planetCells.section == 0)
            {
                selectedPlanet = self.planets[planetCells.row];
            }
            else if (planetCells.section == 1)
            {
                selectedPlanet = self.addSpaceObject[planetCells.row];
            }
            nextViewController.currentPlanetObject = selectedPlanet;
        }
    }
    //To set a segue with a accessory detail button, use below, linking an instance of MSOWSpaceObject in the DataViewController with the row selected in the TableView. The else if establishes how to have the added object be the segue view controller object.
    if ([sender isKindOfClass:[NSIndexPath class]])
    {
        if ([segue.destinationViewController isKindOfClass:[MSOWPlanetDataViewController class]])
        {
            MSOWPlanetDataViewController *targetDataViewController = segue.destinationViewController;
            NSIndexPath *planetDataTable = sender;
            MSOWSpaceObject *selectedPlanet;
            if (planetDataTable.section == 0)
            {
                selectedPlanet = self.planets[planetDataTable.row];
            }
            else if (planetDataTable.section == 1)
            {
                selectedPlanet = self.addSpaceObject[planetDataTable.row];
            }
            targetDataViewController.planetObject = selectedPlanet;
        }
    }
    //To use a ViewController delegate property to access the current View Controller object to pass data/info to/from another View Controller using a protocol to tell a delegate to perform a method
    if ([segue.destinationViewController isKindOfClass:[MSOWAddObjectViewController class]])
    {
        MSOWAddObjectViewController *addObjectVC = segue.destinationViewController;
        addObjectVC.addObjectDelegate = self;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MSOWAddObjectViewControllerDelegate

- (void)didCancel
{
    //NSLog(@"didCancel");
    [self dismissViewControllerAnimated:YES completion:nil];
}
//To add a new object to an existing array, we use our protocol method to create the array once and then recognize a new object which gets added to the existing array and saved. Using a delegate we're giving access to our tableViewController from our add Object controller so the data can be passed. Storing is only true for the applications session.
- (void)addObject:(MSOWSpaceObject *)addedSpaceObject
{
    //Commented out instance of addSpaceObject here because replaced it with lazy instantiation above
    //    if (!self.addSpaceObject)
//    {
//        self.addSpaceObject = [[NSMutableArray alloc] init];
//    }
    [self.addSpaceObject addObject:addedSpaceObject];
    //Will save to NSUserDefaults here
    NSMutableArray *spaceObjectsAsPropertyLists = [[[NSUserDefaults standardUserDefaults] arrayForKey:ADDED_SPACED_OBJECTS_KEY] mutableCopy];
    if (!spaceObjectsAsPropertyLists) spaceObjectsAsPropertyLists = [[NSMutableArray alloc] init];
    [spaceObjectsAsPropertyLists addObject:[self spaceObjectAsAPropertyList:addedSpaceObject]];
    [[NSUserDefaults standardUserDefaults] setObject:spaceObjectsAsPropertyLists forKey:ADDED_SPACED_OBJECTS_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [self.tableView reloadData];
}

#pragma mark - Helper Methods
//NSDictionary below establishes the new objects data as a dictionary that can be added to the array and stored.
-(NSDictionary *)spaceObjectAsAPropertyList:(MSOWSpaceObject *)additionalSpaceObject
{
    NSData *addedImageData = UIImagePNGRepresentation(additionalSpaceObject.planetImage);
    NSDictionary *planetDictionary = @{PLANET_NAME : additionalSpaceObject.planetName, PLANET_GRAVITY : @(additionalSpaceObject.planetGravitationalForce), PLANET_DIAMETER : @(additionalSpaceObject.planetDiameter), PLANET_YEAR_LENGTH : @(additionalSpaceObject.planetYearLength), PLANET_DAY_LENGTH : @(additionalSpaceObject.planetDayLength), PLANET_TEMPERATURE : @(additionalSpaceObject.planetTemperature), PLANET_NUMBER_OF_MOONS : @(additionalSpaceObject.planetMoons), PLANET_NICKNAME : additionalSpaceObject.planetNickname, PLANET_INTERESTING_FACT : additionalSpaceObject.planetFact, PLANET_IMAGE : addedImageData};
    
    return planetDictionary;
}

-(MSOWSpaceObject *)spaceObjectForDictionary:(NSDictionary *)addedDictionary
{
    MSOWSpaceObject *addedObject = [[MSOWSpaceObject alloc] initWithPlanetData:addedDictionary andImage:[UIImage imageNamed:@"EinsteinRing.jpg"]];
    return addedObject;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    if ([self.addSpaceObject count])
    {
        return 2;
    }
    else
    {
        return 1;
    }
    
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
    if (section == 1)
    {
        return [self.addSpaceObject count];
    }
    else
    {
        return [self.planets count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...one at a time first and then for multiple sections
    //Use new Space Object to customize added table cell title and subtitle, and a static image for all added objects
    if (indexPath.section == 1)
    {
        MSOWSpaceObject *addedPlanet = [self.addSpaceObject objectAtIndex:indexPath.row];
        cell.textLabel.text = addedPlanet.planetName;
        cell.detailTextLabel.text = addedPlanet.planetNickname;
        cell.imageView.image = addedPlanet.planetImage;
    }
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
    //Access the list of MSOWSpaceObject dictionaries from the planets array, use the properties for MSOWSpaceObject to update cell's properties
    else
    {
        MSOWSpaceObject *planet = [self.planets objectAtIndex:indexPath.row];
        cell.textLabel.text = planet.planetName;
        cell.detailTextLabel.text = planet.planetNickname;
        cell.imageView.image = planet.planetImage;
    }
    //customize the appearance of the TableViewCells in the object dictionary
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    
    return cell;
}

#pragma mark UITableView Delegate
//the method below uses an NSString Identifier set up in the Storyboard and an id for the sender, which can be any object
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"push to planet data" sender:indexPath];
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

//
//  MSOWSpaceObject.m
//  Out of This World
//
//  Created by Mat Sletten on 4/28/14.
//  Copyright (c) 2014 Mat Sletten. All rights reserved.
//

#import "MSOWSpaceObject.h"
#import "AstronomicalData.h"

@implementation MSOWSpaceObject

-(id)init
{
    self = [self initWithPlanetData:nil andImage:nil];
    return self;
}

-(id)initWithPlanetData:(NSDictionary *)planetData andImage:(UIImage *)planetView
{
    self = [super init];
    
    self.planetName = planetData[PLANET_NAME];
    self.planetNickname = planetData[PLANET_NICKNAME];
    self.planetFact = planetData[PLANET_INTERESTING_FACT];
    self.planetDiameter = [planetData[PLANET_DIAMETER] floatValue];
    self.planetGravitationalForce = [planetData[PLANET_GRAVITY] floatValue];
    self.planetDayLength = [planetData[PLANET_DAY_LENGTH] floatValue];
    self.planetYearLength = [planetData[PLANET_YEAR_LENGTH] floatValue];
    self.planetMoons = [planetData[PLANET_NUMBER_OF_MOONS] intValue];
    self.planetTemperature =[planetData[PLANET_TEMPERATURE] floatValue];
    
    self.planetImage = planetView;
    
    return self;    
}


@end

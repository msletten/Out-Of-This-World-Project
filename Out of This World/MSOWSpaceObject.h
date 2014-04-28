//
//  MSOWSpaceObject.h
//  Out of This World
//
//  Created by Mat Sletten on 4/28/14.
//  Copyright (c) 2014 Mat Sletten. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSOWSpaceObject : NSObject

@property (strong, nonatomic) NSString *planetName;
@property (nonatomic) float planetGravitationalForce;
@property (nonatomic) float planetDiameter;
@property (nonatomic) float planetYearLength;
@property (nonatomic) float planetDayLength;
@property (nonatomic) float planetTemperature;
@property (nonatomic) int planetMoons;
@property (strong, nonatomic) NSString *planetNickname;
@property (strong, nonatomic) NSString *planetFact;

@property (strong, nonatomic) UIImage *planetImage;

-(id)initWithPlanetData:(NSDictionary *)planetData andImage:(UIImage *)planetView;

@end

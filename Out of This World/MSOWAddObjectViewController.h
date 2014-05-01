//
//  MSOWAddObjectViewController.h
//  Out of This World
//
//  Created by Mat Sletten on 4/30/14.
//  Copyright (c) 2014 Mat Sletten. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSOWAddObjectViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *addNameText;

@property (strong, nonatomic) IBOutlet UITextField *addNicknameText;

@property (strong, nonatomic) IBOutlet UITextField *addDiameterText;

@property (strong, nonatomic) IBOutlet UITextField *addTemperatureText;

@property (strong, nonatomic) IBOutlet UITextField *addMoonsText;

@property (strong, nonatomic) IBOutlet UITextField *addFactText;


- (IBAction)addButtonPressed:(UIButton *)sender;

- (IBAction)cancelButtonPressed:(UIButton *)sender;

@end

//
//  SHCViewController.m
//  SHCReversiGame
//
//  Created by Colin Eberhardt on 07/12/2012.
//  Copyright (c) 2012 Colin Eberhardt. All rights reserved.
//

#import "SHCViewController.h"

@interface SHCViewController ()

@end

@implementation SHCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // set the various background images
    self.backgroundImage.image = [UIImage imageNamed: @"Reversi.png"];
    self.gameOverImage.image = [UIImage imageNamed: @"GameOver.png"];
    self.gameOverImage.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

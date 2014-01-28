//
//  SNViewControllerLogout.m
//  AppCidade
//
//  Created by Gabriel on 1/27/14.
//  Copyright (c) 2014 SemNorte. All rights reserved.
//

#import "SNViewControllerLogout.h"

@interface SNViewControllerLogout ()

@end

@implementation SNViewControllerLogout

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)botaoLogout:(id)sender
{
    [PFUser logOut];
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end

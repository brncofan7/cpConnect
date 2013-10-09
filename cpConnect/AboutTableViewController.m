//
//  AboutTableViewController.m
//  cpConnect
//
//  Created by Daniel Wright on 9/25/13.
//  Copyright (c) 2013 Center Point Church. All rights reserved.
//

#import "AboutTableViewController.h"

@interface AboutTableViewController ()

@end

@implementation AboutTableViewController

//- (id)initWithStyle:(UITableViewStyle)style
//{
//    self = [super initWithStyle:style];
//    if (self) {
        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    // Assign our own backgroud for the view
    self.tableView.backgroundColor = [UIColor whiteColor];
    //self.tableView.backgroundColor = [UIColor colorWithRed: 156.0/255.0f green:189.0/255.0f blue:227.0/255.0f alpha:1.0];
    
    
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 2;
}

@end

//
//  SecondViewController.m
//  SFPlaces
//
//  Created by Ralph Samuel on 4/19/13.
//  Copyright (c) 2013 Ralph Samuel. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void) viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear: animated];
    [self.tableView reloadData];
    
   //set local model as the Table's Model
    [[NSUserDefaults standardUserDefaults] setObject: self.model forKey: @"Model"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //gain access to locationsArray in AppDelegate and set to self.model
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.model = [NSArray arrayWithArray: appDelegate.locationsArray];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.model.count;
}


 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //-----
    //Called for each cell when table loads cells
    //returns the text, formatting etc. of a cingle cell
    //------
    
    static NSString *CellIdentifier = @"MyCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier];
    
    //create local dictionary from appropriate model
    NSDictionary *d = [self.model objectAtIndex:indexPath.row];
    
    // Set the text to Location name
    cell.textLabel.text = [d valueForKey: @"name"];
        
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

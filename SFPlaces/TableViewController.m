//
//  SecondViewController.m
//  SFPlaces
//
//  Created by Ralph Samuel on 4/19/13.
//  Copyright (c) 2013 Ralph Samuel. All rights reserved.
//

#import "TableViewController.h"
#import "DetailViewController.h"

@interface TableViewController ()

@property (nonatomic, assign) NSInteger indexSelected;

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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Remember the index
    self.indexSelected = indexPath.row;
    
    // Instigate the segue
    [self performSegueWithIdentifier: @"tableToDetailSegue" sender: self];
}


#pragma mark - Segue Methods


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // This method is called after the destination view controller is created
    //After tableView:didSelectRowAtIndexPath:
    
    DetailViewController* detail = segue.destinationViewController;
    
    // Give the detail view controller the NSDictionary object of the location for the selected cell
    detail.selectedLocationDictionary = [self.model objectAtIndex: self.indexSelected];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

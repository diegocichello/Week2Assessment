//
//  ViewController.m
//  Week2Assessment
//
//  Created by Diego Cichello on 1/16/15.
//  Copyright (c) 2015 Mobile Makers. All rights reserved.
//

#import "RootViewController.h"
#import "City.h"
#import "CityDetailViewController.h"

@interface RootViewController () <UITableViewDataSource,UITableViewDelegate,CityDetailDelegate>

@property NSMutableArray *cities;
@property (weak, nonatomic) IBOutlet UINavigationItem *editButton;
@property BOOL isEditButtonPressed;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSIndexPath *indexPathDeleted;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Initializing and populating the array to fill the tableview
    self.cities = [[NSMutableArray alloc]init];

    [self.cities addObject:[[City alloc]initWithName:@"San Francisco" aState:@"CA" aImage:[UIImage imageNamed:@"SanFrancisco"]]];
    [self.cities addObject:[[City alloc]initWithName:@"New York" aState:@"NY" aImage:[UIImage imageNamed:@"NewYork"]]];
    [self.cities addObject:[[City alloc]initWithName:@"Las Vegas" aState:@"NV" aImage:[UIImage imageNamed:@"LasVegas"]]];
    [self.cities addObject:[[City alloc]initWithName:@"Miami" aState:@"FL" aImage:[UIImage imageNamed:@"Miami" ]]];

}

- (void) viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}


#pragma TableView Delegate Methods

//-------------------- Table View Methods ---------------------------------------------


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cities.count;
}


- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];

    City *city  = [self.cities objectAtIndex:indexPath.row];

    cell.textLabel.text = city.name;
    cell.detailTextLabel.text = city.state;
    cell.imageView.image = [self resizeImage:city.image imageSize:CGSizeMake(70,50)];


    return cell;



}
//Method that sets the do the delete button real time without editing it
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{


    UIAlertView *deleteAlert = [[UIAlertView alloc]init];
    deleteAlert.delegate = self;
    deleteAlert.title =@"Delete warning!";
    deleteAlert.message = @"Are you sure you want to delete?";
    [deleteAlert addButtonWithTitle:@"No!"];
    [deleteAlert addButtonWithTitle:@"Yes"];

    [deleteAlert show];

    
    
    
}

//Method that check if you can move Rows
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//Method that is trigger when you move rows
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    //Just create a dummy String to hold data, and exchange rows.
    NSString *stringToBeMoved = [self.cities objectAtIndex:sourceIndexPath.row];
    [self.cities removeObjectAtIndex:sourceIndexPath.row];
    [self.cities insertObject:stringToBeMoved atIndex:destinationIndexPath.row];
}



#pragma Alert View Handlers

//-----------------Alert View Handlers ---------------------------------------------------------

#pragma City Delegate Method

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{

    if(buttonIndex==1)
    {

        [self.cities removeObjectAtIndex:self.indexPathDeleted.row];
        [self.tableView reloadData];

    }
    
}

#pragma CityDetailDelegate Methods

//---------------------City Delegate Methods----------------------------------------------------

- (void)didTitleChangeButtonPressed:(NSString *)cityName
{
    self.title = cityName;
}

#pragma Segue and Buttons Logics
//---------------------Segue and Button Logics --------------------------------------------------
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CityDetailViewController *cityVC = segue.destinationViewController ;
    cityVC.delegate = self;

    NSIndexPath *myIndexPath = [self.tableView
                                indexPathForSelectedRow];


    cityVC.currentCity = [self.cities objectAtIndex:myIndexPath.row];

}

- (IBAction)onEditButtonPressed:(UIBarButtonItem *)editButton
{

    //Change if its Done, or Editing

    if (self.isEditButtonPressed)
    {
        editButton.title = @"Edit";
        [self.tableView setEditing:false animated:false];
    }
    else
    {
        editButton.title = @"Done";
        [self.tableView
         setEditing:true animated:true];
    }
    self.isEditButtonPressed = !self.isEditButtonPressed;

    
    
    
}

#pragma Other Methods

//---------------------------- Other Methods --------------------------------------------------


-(UIImage*)resizeImage:(UIImage *)image imageSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0,0,size.width,size.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
    return newImage;
    
}






@end

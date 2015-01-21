//
//  CityDetailViewController.m
//  Week2Assessment
//
//  Created by Diego Cichello on 1/16/15.
//  Copyright (c) 2015 Mobile Makers. All rights reserved.
//

#import "CityDetailViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "WikipediaViewController.h"

@interface CityDetailViewController () <UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *cityImageView;
@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityStateLabel;
@property (weak, nonatomic) IBOutlet UITextField *cityNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *cityStateTextField;
@property (weak, nonatomic) IBOutlet UILabel *wikipediaLabel;
@property BOOL isEditButtonPressed;


@end

@implementation CityDetailViewController

#pragma view methods


// ------------------ View Methods ------------------------------------------------------------
- (void)viewDidLoad {
    [super viewDidLoad];

    //Set the labels to the current city
    self.cityNameLabel.text = self.currentCity.name;
    self.cityStateLabel.text = self.currentCity.state;
    self.cityImageView.image = self.currentCity.image;

    //Making the Wikipedia Label to looks like a button
    self.wikipediaLabel.layer.borderColor = [UIColor whiteColor].CGColor;
    self.wikipediaLabel.layer.borderWidth = 1.0;
    [self.wikipediaLabel.layer setCornerRadius:8];
    self.wikipediaLabel.clipsToBounds=true;
}

#pragma Buttons or Labels that works as button methods

// -------- Buttons or Labels that works as button methods -------------------------------------

- (IBAction)onEditButtonPressed:(UIBarButtonItem *)editButton
{
    //Change if its Done, or Editing

    if (!self.isEditButtonPressed)
    {
        editButton.title = @"Done";

        self.cityNameTextField.text = self.cityNameLabel.text;
        self.cityStateTextField.text = self.cityStateLabel.text;


    }
    else
    {
        editButton.title = @"Edit";
        self.cityNameLabel.text = self.cityNameTextField.text;
        self.cityStateLabel.text = self.cityStateTextField.text;

        self.currentCity.name = self.cityNameLabel.text;
        self.currentCity.state = self.cityStateLabel.text;
    }
    self.isEditButtonPressed = !self.isEditButtonPressed;
    self.cityNameLabel.hidden = !self.cityNameLabel.hidden;
    self.cityNameTextField.hidden = !self.cityNameTextField.hidden;
    self.cityStateTextField.hidden = !self.cityStateTextField.hidden;
    self.cityStateLabel.hidden = !self.cityStateLabel.hidden;


    
}

//Delegate method to be used to change the title
- (IBAction)changeTitleButtonPressed:(id)sender
{
    [self.delegate didTitleChangeButtonPressed:self.currentCity.name];
}


// IBAction from tap gesture, it's empty but some logic here would be useful later
- (IBAction)onWikipediaButtonTapped:(UITapGestureRecognizer *)sender
{

}

- (IBAction) prepareForUnwindSegue: (UIStoryboardSegue *)segue
{

}


// Prepare for segue method to pass the current city to WikipediaViewController
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WikipediaViewController *wikiVC = segue.destinationViewController;
    wikiVC.currentCity = self.currentCity;

}





@end

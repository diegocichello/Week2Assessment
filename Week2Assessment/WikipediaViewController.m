//
//  WikipediaViewController.m
//  Week2Assessment
//
//  Created by Diego Cichello on 1/16/15.
//  Copyright (c) 2015 Mobile Makers. All rights reserved.
//

#import "WikipediaViewController.h"

@interface WikipediaViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *wikipediaWebView;

@end

@implementation WikipediaViewController


#pragma View Methods

// --------------------- View Methods ------------------------------------------------------
- (void)viewDidLoad {
    [super viewDidLoad];

    [self goToURLWithString:[self createURLtoBeUsed]];

}

#pragma URL related methods
// --------------------- URL related methods ------------------------------------------------


//Create the URL to be used on webview, replacing blank spaces with underscores
- (NSString *) createURLtoBeUsed
{

    NSString *wikipediaURL = @"en.wikipedia.org/wiki/";

    //Replacing blank spaces with underscore
    NSString *underscoredName = self.currentCity.name.copy;
    underscoredName = [self.currentCity.name stringByReplacingOccurrencesOfString:@" " withString:@"_"];

    //Appending the correct name string
    wikipediaURL = [wikipediaURL stringByAppendingString:underscoredName];

    return wikipediaURL;

}


//Go to URL method
- (void) goToURLWithString:(NSString *)string
{
    if (![string hasPrefix:@"http://"])
    {
        string = [NSString stringWithFormat:@"http://%@", string];
    }

    NSURL *addressUrl = [NSURL URLWithString:string];
    NSURLRequest *addressRequest = [NSURLRequest requestWithURL:addressUrl];
    [self.wikipediaWebView loadRequest:addressRequest];
    
}



@end

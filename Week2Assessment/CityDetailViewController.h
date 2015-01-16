//
//  CityDetailViewController.h
//  Week2Assessment
//
//  Created by Diego Cichello on 1/16/15.
//  Copyright (c) 2015 Mobile Makers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"



@protocol CityDetailDelegate <NSObject>


- (void) didTitleChangeButtonPressed:(NSString *)cityName;


@end



@interface CityDetailViewController : UIViewController

@property City *currentCity;
@property (nonatomic,weak) id<CityDetailDelegate> delegate;

@end

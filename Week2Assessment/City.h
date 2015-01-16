//
//  City.h
//  Week2Assessment
//
//  Created by Diego Cichello on 1/16/15.
//  Copyright (c) 2015 Mobile Makers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface City : NSObject




@property NSString *name;
@property NSString *state;
@property UIImage *image;


-(instancetype)initWithName:(NSString *)name aState:(NSString *)state aImage:(UIImage *)image;
-(instancetype)initWithName:(NSString *)name aState:(NSString *)state;

-(instancetype)initWithName:(NSString *)name;


@end

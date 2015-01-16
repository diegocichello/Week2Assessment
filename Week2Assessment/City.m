//
//  City.m
//  Week2Assessment
//
//  Created by Diego Cichello on 1/16/15.
//  Copyright (c) 2015 Mobile Makers. All rights reserved.
//

#import "City.h"
#import <UIKit/UIKit.h>



@implementation City

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        return[self initWithName:nil];
    }
    return self;
}

-(instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self)
    {
        return[self initWithName:name aState:nil];
    }
    return self;
}

-(instancetype)initWithName:(NSString *)name aState:(NSString *)state
{
    self = [super init];
    if (self)
    {

        return[self initWithName:name aState:state aImage:nil];
    }
    return self;
}

-(instancetype)initWithName:(NSString *)name aState:(NSString *)state aImage:(UIImage *)image;
{
    self = [super init];
    if (self)
    {
        self.name = name;
        self.state = state;
        self.image = image;
        return self;
    }
    return self;
}




@end

//
//  IphoneImages.m
//  IphoneImages
//
//  Created by David Guichon on 2017-03-27.
//  Copyright © 2017 David Guichon. All rights reserved.
//

#import "IphoneImages.h"

@interface IphoneImages ()

@property (nonatomic, strong) NSArray *images;

@end

@implementation IphoneImages

- (instancetype)init
{
    self = [super init];
    if (self) {
        _images = [[NSArray alloc] init];
    }
    self.images = @[@"http://i.imgur.com/bktnImE.png",
                    @"http://i.imgur.com/zdwdenZ.png",
                    @"http://i.imgur.com/CoQ8aNl.png",
                    @"http://i.imgur.com/2vQtZBb.png",
                    @"http://i.imgur.com/y9MIaCS.png"];
    
    return self;
}

-(NSString *)getNewURL{
    int i= arc4random_uniform(5);
    return self.images[i];
}

@end

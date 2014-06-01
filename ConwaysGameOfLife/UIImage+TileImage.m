//
//  UIImage+TileImage.m
//  TileImage
//
//  Created by Stevenson on 5/31/14.
//  Copyright (c) 2014 Steven Stevenson. All rights reserved.
//

#import "UIImage+TileImage.h"

@implementation UIImage (TileImage)

- (UIImage *)cropImageInRect:(CGRect)rect
{
    if (self.scale > 1.0f) {
        rect = CGRectMake(rect.origin.x * self.scale,
                          rect.origin.y * self.scale,
                          rect.size.width * self.scale,
                          rect.size.height * self.scale);
    }
    
    CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    UIImage *result = [UIImage imageWithCGImage:imageRef scale:self.scale orientation:self.imageOrientation];
    CGImageRelease(imageRef);
    return result;
}

@end

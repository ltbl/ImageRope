//
//  G9ImageRoper.m
//  ImageRope
//
//  Created by kkung on 12. 8. 28..
//  Copyright (c) 2012년 GAE9.COM. All rights reserved.
//

#import "G9ImageRoper.h"
#import "NSImage+saveAs.h"

@implementation G9ImageRoper

- (NSSize)calculateImageSize:(NSArray *)images
{
    return [self calculateImageSize:images withHeightSpacing:10];
}

- (NSSize)calculateImageSize:(NSArray *)images withHeightSpacing:(CGFloat)space
{
    CGFloat maxW = 0;
    CGFloat height = 0;
    
    for (NSString *path in images) {
        
        NSImage *image = [[NSImage alloc] initWithContentsOfFile:path];
        if ( image.size.width > maxW) {
            maxW = image.size.width;
        }
        
        height = height + image.size.height + space;
        
    }
    
    return NSMakeSize(maxW, height-space);
}

- (void)ropeImage:(NSArray *)images withHeightSpacing:(CGFloat)space forName:(NSString *)fileName
{
    NSSize canvasSize = [self calculateImageSize:images];
    NSImage *canvas = [[NSImage alloc] initWithSize:canvasSize];
    NSPoint cursor = NSMakePoint(0, 0);
    
    for (NSString *path in images) {
        [canvas lockFocus];
        NSImage *image = [[NSImage alloc] initWithContentsOfFile:path];
        [image drawAtPoint:cursor fromRect:NSMakeRect(0, 0, image.size.width, image.size.height) operation:NSCompositeCopy fraction:1.0];
        NSLog(@"Draw x:%lf y:%lf with (%lf, %lf)", cursor.x, cursor.y, image.size.width, image.size.height);
        cursor.y = cursor.y + image.size.height + space;
        [canvas unlockFocus];
    }
    
    [canvas saveAsJpegWithName:fileName];
}

@end

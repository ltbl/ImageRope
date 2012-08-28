//
//  NSImage+saveAs.m
//  ImageRope
//
//  Created by kkung on 12. 8. 28..
//  Copyright (c) 2012년 GAE9.COM. All rights reserved.
//

#import "NSImage+saveAs.h"

@implementation NSImage (saveAs)

- (void)saveAsJpegWithName:(NSString *)fileName
{
    NSData *imageData = [self TIFFRepresentation];
    NSBitmapImageRep *imageRep = [NSBitmapImageRep imageRepWithData:imageData];
    NSDictionary *imageProps = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:0.9] forKey:NSImageCompressionFactor];
    imageData = [imageRep representationUsingType:NSJPEGFileType properties:imageProps];
    [imageData writeToFile:fileName atomically:NO];
}

@end

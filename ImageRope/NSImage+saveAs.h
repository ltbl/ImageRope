//
//  NSImage+saveAs.h
//  ImageRope
//
//  Created by kkung on 12. 8. 28..
//  Copyright (c) 2012년 GAE9.COM. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSImage (saveAs)
- (void) saveAsJpegWithName:(NSString *)fileName;
@end

//
//  G9DropZoneDelegate.h
//  ImageRope
//
//  Created by kkung on 12. 8. 28..
//  Copyright (c) 2012년 GAE9.COM. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol G9DropZoneDelegate <NSObject>
- (void)dropReceived:(NSArray *)filenames;
@end

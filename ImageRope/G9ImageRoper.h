//
//  G9ImageRoper.h
//  ImageRope
//
//  Created by kkung on 12. 8. 28..
//  Copyright (c) 2012년 GAE9.COM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface G9ImageRoper : NSObject

- (NSSize) calculateImageSize:(NSArray *)images;
- (NSSize) calculateImageSize:(NSArray *)images withHeightSpacing:(CGFloat) space;
- (void)ropeImage:(NSArray *)images withHeightSpacing:(CGFloat)space forName:(NSString *)fileName;
@end
